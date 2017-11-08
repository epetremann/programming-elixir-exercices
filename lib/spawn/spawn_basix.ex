defmodule Spawn.SpawnBasic do
  def start do
    spawn(Spawn.SpawnBasic, :pong, [])
  end

  def pong do
    receive do
      {sender, :ping} ->
          IO.puts "ping from #{Kernel.inspect(sender)}"
          sender |> send({self(), :pong})
          pong()
      {sender, msg} ->
        sender |> send({:ok, "{Hello #{msg}}"})
        pong()
      :halt -> IO.puts("#{Kernel.inspect(self())} : Halt! received")
    end
  end


  def client() do
    spawn(Spawn.SpawnBasic, :loop_client, [])
  end

  def loop_client() do
    p_greet = start()
    p_greet |> send({self(), :ping})
    ping(0)
  end

  defp ping(n) do
    receive do
      {sender, :pong} -> sender |> send({self(), :ping})
      IO.puts("#{n} pong(s) from #{Kernel.inspect(sender)}")
      :timer.sleep(1000)
      ping(n+1)
    after 500 -> IO.puts("The greeter has gone away after #{n} pong(s)" )
    end
  end

end

defmodule Link1 do
  import :timer, only: [sleep: 1]

  def sad_function() do
    sleep 500
    exit(:boom)
  end

  def run() do
    # Process.flag(:trap_exit, true)
    res = spawn_monitor(Link1, :sad_function, [])
    IO.puts inspect(res)
    receive do
      {:EXIT, pid, reason} -> IO.puts ":EXIT, #{inspect(pid)} #{reason}"
      msg -> IO.puts "Message received: #{inspect msg}"
    after 1000->
      IO.puts "Nothing happened as far as I am concerned."
    end
  end
@doc """
Exercise: WorkingWithMultipleProcesses-3

Use spawn_link to start a process, and have that process send a message to the
parent and then exit immediately.
Meanwhile, sleep for 500 ms in the parent, then receive as many messages as are
waiting. Trace what you receive.
Does it matter that you weren’t waiting for the notification from the child when it exited?
"""

def loop_simple(parent) do
  parent |> send({self(), :bye})
  raise(ArithmeticError, message: "stop")
end

def run_simple() do
  spawn_link(Link1, :loop_simple, [self()])
  sleep(500)
  for _i <- 1..10 do
    receive do
      msg -> IO.puts inspect(msg)
    after 1000 -> IO.puts "That's all folks!"
  end
end

end


end

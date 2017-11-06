defmodule Query do
  @names ["Grumpy", "Dave", "Dopey", "Shaquille", "Sneezy"]
  @heights [124, 188, 132, 216, 128]

  def people() do
    [@names, @heights] |> List.zip |> Enum.map(fn({name, height}) -> %{name: name, height: height} end)
  end

  def select(hmin \\ 150) do
    peoples = people()
    IO.inspect(for person = %{height: height} <- peoples, height > hmin, do: person)
    :ok
  end
end

defmodule HotelRoom do
  def book(%{name: name, height: height }) when height > 190 do
    IO.puts("Need extra long bed for #{name}")
  end
  def book(%{name: name, height: height }) when height < 130 do
    IO.puts("Need low shower controls for #{name}")
  end
  def book(person) do
    IO.puts "Need regular bed for #{person.name}"
  end

  def test_book() do
    Query.people() |> Enum.each(&book/1) 
  end
end

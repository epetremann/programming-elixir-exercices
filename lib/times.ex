defmodule Times do
  def double(n) when is_number(n), do: n*2
  @doc """
  Exercise: ModulesAndFunctions-1

Extend the Times module with a triple function that multiplies its parameter by three.

Exercise: ModulesAndFunctions-2

Run the result in iex. Use both techniques to compile the file.


  """
  def triple(n) when is_number(n), do: n*3
  @doc """
  Exercise: ModulesAndFunctions-3

  Add a quadruple function. (Maybe it could call the double function.…)
  """
  def quad(n) when is_number(n), do: n*4
end

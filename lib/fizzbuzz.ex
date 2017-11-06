defmodule FizzBuzz do
@doc """
Exercise: ControlFlow-1

Rewrite the FizzBuzz example using case.
"""

  def upto(n) when is_integer(n) and n > 0, do: upto(1, n, [])

  def upto(_current, 0, result), do: result |> Enum.reverse
  def upto(current, left, result) do
    next_answer = case {rem(current,3), rem(current,5)} do
      {0,0} -> "FizzBuzz"
      {0,_} -> "Fizz"
      {_,0} -> "Buzz"
      {_,_} -> current
    end # enc case
    upto(current+1, left-1, [next_answer | result])

  end # end function upto/3
end # module FizzBuzz

defmodule MyList do


  @moduledoc """
  Rprogramming Elixir

  """
  @doc """

  Exercise: ListsAndRecursion-4

  Write a function MyList.span(from, to) that returns a list of the numbers from from up to to.
  """


  def span(from, to) when is_integer(from) and is_integer(to) do
    span(from, to, [])
  end

  defp span(from, to, list) when from == to, do: [to | list]
  defp span(from, to, list) when from < to, do: span(from, to-1, [to | list])
  defp span(from, to, list) when from > to, do: span(from, to+1, [to | list])


@doc """
Exercise: ListsAndRecursion-0

I defined our sum function to carry a partial total as a second parameter
so I could illustrate how to use accumulators to build values.
The sum function can also be written without an accumulator.
Can you do it?
"""
def sum([]), do: 0
def sum([head | tail]), do: head + sum(tail)
end

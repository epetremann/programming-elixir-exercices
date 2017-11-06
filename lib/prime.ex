defmodule Prime do
  @doc """
  Exercise: ListsAndRecursion-7

In the last exercise of Chapter 7, ​Lists and Recursion​,
you wrote a span function.
Use it and list comprehensions to return a list of the prime numbers from 2 to n.
  """
  def primes(2), do: [2]
  def primes(n) when is_integer(n) and (n>2) do
    temp_primes = for x <- MyList.span(3,n),
       !(Enum.any?(MyList.span(2,x-1), &(rem(x,&1)==0)) ) do x
     end # for x <-MyList
     [2 | temp_primes]
   end # function primes(n)







end # module Prime

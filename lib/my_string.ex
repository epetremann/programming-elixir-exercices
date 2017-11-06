defmodule MyString do

  @doc """
  Exercise: StringsAndBinaries-1

Write a function that returns true if a single-quoted string contains only printable ASCII characters (space through tilde).
  """
  @spec is_printable?(list) :: boolean
  def is_printable?(input_list) do
    !( input_list |> Enum.any?(fn(x) -> ((x < ?\ ) or (x > ?~)) end) )
  end

@doc """
Exercise: StringsAndBinaries-2

Write an anagram?(word1, word2) that returns true if its parameters are anagrams
"""
@spec anagram?(list, list) :: boolean
def anagram?(string1, string2) do
  sort_and_filter(string1) == sort_and_filter(string2)
end
defp sort_and_filter(input_string) do
  input_string
    |> String.downcase
    |> to_charlist
    |> Enum.sort
    |>  to_string
    |> String.trim

end

@doc """
Exercise: StringsAndBinaries-4

(Hard) Write a function that takes a single-quoted string of the
form number [+-*/] number
and returns the result of the calculation. T
he individual numbers do not have leading plus or minus signs.

calculate(’123 + 27’) # => 150
"""

  def calculate(input_string) do
    [factor1, operator, factor2] = ~w"#{input_string}"
    int1 = String.to_integer(factor1)
    int2 = String.to_integer(factor2)
    case operator do
      "+" -> int1 + int2
      "-" -> int1 - int2
      "*" -> int1 * int2
      "/" -> int1 / int2
    end # case operator
  end
@doc """
Exercise: StringsAndBinaries-5

Write a function that takes a list of dqs and prints each on a separate line,
centered in a column that has the width of the longest string.
Make sure it works with UTF characters.
​ 	​iex>​ center([​"​​cat"​, ​"​​zebra"​, ​"​​elephant"​])
​ 	  cat
​ 	 zebra
​ 	elephant
"""
  def center(input_list) do
    max_size = Enum.max(for s <- input_list do String.length(s) end)
    for s <- input_list do IO.puts "[#{center(s,max_size)}]" end
  end
  defp center(input_string,full_size) do
    #IO.puts("input_string: #{input_string}, size #{size}")
    left_pad = div(full_size + String.length(input_string),2)
    input_string
      |> String.pad_leading(left_pad)   #left pad
      |> String.pad_trailing(full_size) # right pad
  end

@doc """
Exercise: StringsAndBinaries-6

Write a function to capitalize the sentences in a string. Each sentence is terminated by a period and a space. Right now, the case of the characters in the string is random.
​ 	​iex>​ capitalize_sentences(​"​​oh. a DOG. woof. "​)
​ 	"Oh. A dog. Woof. "
"""

def capitalize_sentences(input_string) do
  input_string |> String.split(". ") |> Enum.map(&String.capitalize/1) |> join_strings(". ")
end

defp join_strings([],_separator), do: ""
defp join_strings([ s1 ],_separator), do: s1
defp join_strings([s1,s2 | tail ],separator) do
  s1 <> separator <> s2 <> separator <> join_strings(tail,separator)
end
end

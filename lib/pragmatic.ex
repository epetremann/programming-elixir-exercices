defmodule Pragmatic do
  @moduledoc """

Exercise: ListsAndRecursion-8

The Pragmatic Bookshelf has offices in Texas (TX) and North Carolina (NC).
So we have to charge sales tax on orders shipped to these states.
The rates can be expressed as a keyword list:[21]
​ 	tax_rates = [ NC: 0.075, TX: 0.08 ]

Here’s a list of orders:
​ 	orders = [
​ 	    [ id: 123, ship_to: :NC, net_amount: 100.00 ],
​ 	    [ id: 124, ship_to: :OK, net_amount:  35.50 ],
​ 	    [ id: 125, ship_to: :TX, net_amount:  24.00 ],
​ 	    [ id: 126, ship_to: :TX, net_amount:  44.80 ],
​ 	    [ id: 127, ship_to: :NC, net_amount:  25.00 ],
​ 	    [ id: 128, ship_to: :MA, net_amount:  10.00 ],
​ 	    [ id: 129, ship_to: :CA, net_amount: 102.00 ],
​ 	    [ id: 130, ship_to: :NC, net_amount:  50.00 ] ]

Write a function that takes both lists and returns a copy of the orders,
but with an extra field, total_amount, which is the net plus sales tax.
If a shipment is not to NC or TX, there’s no tax applied.
"""
@tax_rates  [ NC: 0.075, TX: 0.08 ]
@orders  [ [ id: 123, ship_to: :NC, net_amount: 100.00 ], \
      [ id: 124, ship_to: :OK, net_amount:  35.50 ], \
      [ id: 125, ship_to: :TX, net_amount:  24.00 ], \
      [ id: 126, ship_to: :TX, net_amount:  44.80 ], \
      [ id: 127, ship_to: :NC, net_amount:  25.00 ], \
      [ id: 128, ship_to: :MA, net_amount:  10.00 ], \
      [ id: 129, ship_to: :CA, net_amount: 102.00 ], \
      [ id: 130, ship_to: :NC, net_amount:  50.00 ] ]


def orders_with_tax(orders) do
  for x <- orders do
    destination = x[:ship_to]
    tax_rate = case @tax_rates[destination] do
      nil -> 0
      rate -> rate
    end # case
    total_amount = x[:net_amount] * (1 + tax_rate)
    x |> Keyword.update(:total_amount, total_amount, &(&1))
  end # for x <- @orders
end # function orders_with_tax


@doc """
Exercise: StringsAndBinaries-7

Chapter 7 had an exercise about calculating sales tax. We now have the sales information in a file of comma-separated id, ship_to, and amount values. The file looks like this:
​ 	id,ship_to,net_amount
​ 	123,:NC,100.00
​ 	124,:OK,35.50
​ 	125,:TX,24.00
​ 	126,:TX,44.80
​ 	127,:NC,25.00
​ 	128,:MA,10.00
​ 	129,:CA,102.00
​ 	120,:NC,50.00

Write a function that reads and parses this file and then passes the result to the sales_tax function. Remember that the data should be formatted into a keyword list, and that the fields need to be the correct types (so the id field is an integer, and so on).

You’ll need the library functions File.open, IO.read(file, :line), and IO.stream(file).
"""
  def read_orders(file_name \\ "data//orders.csv") do
    {:ok, data} = File.read(file_name)
    [header | lines] = data |> String.split |> Enum.map(&(String.split(&1,",")))
    header = (header |> Enum.map(&String.to_atom(&1)))
    # convert list of 3 strings in [integer, atom. float]
    lines |>  Enum.map(fn([id, ship_to, net_amount]) ->
      [String.to_integer(id),
      String.to_atom(String.trim_leading(ship_to,":")),
      String.to_float(net_amount)] end)
      |> Enum.map(&(Enum.zip(header,&1)))
      |> orders_with_tax

  end
end

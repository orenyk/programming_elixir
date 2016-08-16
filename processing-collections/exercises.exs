Code.require_file("lists_and_recursion.exs", "lists-and-recursion/")

defmodule Primes do
  def until(n) when n > 2 do
    range =  MyList.span(2,n)

    range -- for a <- range, b <- range, b <= a, a*b <= n, do: a*b
  end
end

# ListsAndRecursion-8
defmodule TaxMan do
  def tax(orders, tax_rates) do
    for [id, {:ship_to, state_code}, {:net_amount, net_amount}] <- orders do
      if List.keymember? tax_rates, state_code, 0 do
        [id, ship_to: state_code, net_amount: net_amount, total_amount: net_amount * (1 + tax_rates[state_code])]
      else
        [id, ship_to: state_code, net_amount: net_amount, total_amount: net_amount]
      end
    end
  end
end

tax_rates = [ NC: 0.075, TX: 0.08 ]
orders = [
  [ id: 123, ship_to: :NC, net_amount: 100.00 ],
  [ id: 124, ship_to: :OK, net_amount: 35.50 ],
  [ id: 125, ship_to: :TX, net_amount: 24.00 ],
  [ id: 126, ship_to: :TX, net_amount: 44.80 ],
  [ id: 126, ship_to: :NC, net_amount: 25.00 ],
  [ id: 127, ship_to: :MA, net_amount: 10.00 ],
  [ id: 128, ship_to: :CA, net_amount: 102.00 ],
  [ id: 129, ship_to: :NC, net_amount: 50.00 ] ]

IO.inspect TaxMan.tax(orders, tax_rates)

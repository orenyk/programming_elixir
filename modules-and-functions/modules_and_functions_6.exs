defmodule Chop do
  def guess(n, n..n), do: IO.puts(n)

  def guess(n, low..high) do
    current = div(low + high, 2)
    IO.puts "Is it #{current}?"

    next_guess(n, current, low..high)
  end

  defp next_guess(n, current, _) when current == n do
    guess(n, n..n)
  end

  defp next_guess(n, current, low.._) when current > n do
    guess(n, low..(current-1))
  end

  defp next_guess(n, current, _..high) when current < n do
    guess(n, (current+1)..high)
  end

end

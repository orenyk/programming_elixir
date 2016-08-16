defmodule MyEnum do
  def all?([], _), do: true
  def all?([head | tail], func), do: func.(head) && all?(tail, func)

  def each([], _), do: []
  def each([head | tail], func), do: [func.(head) | each(tail, func)]

  def filter([], _), do: []
  def filter([head | tail], func) do
    if func.(head) do
      [head | filter(tail, func)]
    else
      filter(tail, func)
    end
  end

  def split(list, n) when n >= 0, do: _split([], list, n)

  defp _split(first, [], _), do: {first, []}
  defp _split(first, last, 0), do: {first, last}
  defp _split(first, [head | tail], n), do: _split(first ++ [head], tail, n-1)

  def take(list, n) when n >= 0, do: _take([], list, n)

  defp _take(first, [], _), do: first
  defp _take(first, _, 0), do: first
  defp _take(first, [head | tail], n), do: _take(first ++ [head], tail, n-1)
end

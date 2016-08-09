defmodule MyList do
  def mapsum([], _fun), do: 0
  def mapsum([ head | tail], fun) do
    fun.(head) + mapsum(tail, fun)
  end

  def max([ a | [] ]), do: a
  def max([ head | tail ]) do
    if head > max(tail) do
      head
    else
      max(tail)
    end
  end

  def caesar([], _), do: []
  def caesar([ head | tail], n) when head + n > 122 do
    [head + n - 58 | caesar(tail, n)]
  end
  def caesar([ head | tail], n), do: [head + n | caesar(tail, n)]

  def span(to, to), do: [to]
  def span(from, to) when from < to, do: [from | span(from+1, to)]

end

# ListsAndRecursion-[1,2,3]
IO.puts "MyList.mapsum [1, 2, 3], &(&1 * &1) => #{MyList.mapsum [1, 2, 3], &(&1 * &1)}"
IO.puts "MyList.max([1, 2, 3]) => #{MyList.max([1, 2, 3])}"
IO.puts "MyList.caesar('ryvkve', 13) => #{MyList.caesar 'ryvkve', 13}"

# ListsAndRecursion-4
IO.puts "MyList.span(-1, 10) =>"
IO.inspect MyList.span(-1, 10)

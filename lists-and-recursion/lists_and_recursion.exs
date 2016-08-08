defmodule MyList do
  def map([], _fun), do: []
  def map([ head | tail ], fun), do: [fun.(head) | map(tail, fun)]

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

  def caesar(list, 0), do: list
  def caesar(list, n) do
    new_list = map(list, &MyList._caesar/1)
    caesar(new_list, n-1)
  end

  def _caesar(char) do
    char = char + 1
    if char > 122, do: char = 65
    char
  end
end

IO.puts "MyList.mapsum [1, 2, 3], &(&1 * &1) => #{MyList.mapsum [1, 2, 3], &(&1 * &1)}"
IO.puts "MyList.max([1, 2, 3]) => #{MyList.max([1, 2, 3])}"
IO.puts "MyList.caesar('hello', 1) => #{MyList.caesar 'hello', 1}"

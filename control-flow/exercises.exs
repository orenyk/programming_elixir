defmodule FizzBuzz do
  def upto(n), do: 1..n |> Enum.map(&_fizzbuzz/1)

  defp _fizzbuzz(n) do
    case { rem(n, 3), rem(n, 5), n } do
      { 0, 0, _ } -> "FizzBuzz"
      { 0, _, _ } -> "Fizz"
      { _, 0, _ } -> "Buzz"
      { _, _, n } -> n
    end
  end
end

defmodule Command do
  def ok!({:ok, data}), do: data
  def ok!({error, msg}), do: raise "#{error}: #{msg}"
end

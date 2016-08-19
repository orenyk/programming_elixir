defmodule SalesProcessor do
  def process(file) do
    {:ok, f} = File.open(file)
    headings = f |> IO.read(:line) |> _parse_headings
    IO.stream(f, :line)
    |> Stream.map(&_parse_values/1)
    |> Stream.map(&(Enum.zip(&1, headings)))
    |> Stream.map(&(Enum.map(&1, fn { a, b } -> { b, a } end)))
    |> Stream.map(&_apply_tax/1)
    |> Enum.to_list
  end

  defp _parse_line(line) do
    line
    |> String.trim
    |> String.split(",")
  end

  defp _parse_headings(line) do
    _parse_line(line)
    |> Enum.map(&String.to_atom/1)
  end

  defp _parse_values(line) do
    [val1, val2, val3] = _parse_line(line)
    [String.to_integer(val1),
     String.to_atom(_strip_colon(val2)),
     String.to_float(val3)]
  end

  defp _strip_colon(str), do: String.trim_leading(str, ":")

  def _apply_tax(order) do
    tax_rate = Keyword.get _tax_rates, order[:ship_to], 0.0
    tax = Float.round(tax_rate * order[:net_amount], 2)
    total_amount = order[:net_amount] + tax
    Keyword.put order, :total_amount, total_amount
  end

  def _tax_rates(), do: [ NC: 0.075, TX: 0.08 ]
end

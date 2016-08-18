defmodule StringFuncs do
  def printable?([]), do: true
  def printable?([h|t]), do: printable?(h) && printable?(t)
  def printable?(c), do: c >= 32 && c <= 126
end

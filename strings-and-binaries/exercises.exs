defmodule StringFuncs do
  def printable?([]), do: true
  def printable?([h|t]), do: printable?(h) && printable?(t)
  def printable?(c), do: c >= 32 && c <= 126

  def anagram?(word1, word2), do: Enum.sort(word1) == Enum.sort(word2)
end

defmodule StringFuncs do
  def printable?([]), do: true
  def printable?([h|t]), do: printable?(h) && printable?(t)
  def printable?(c), do: c in ?\s..?~

  def anagram?(word1, word2), do: Enum.sort(word1) == Enum.sort(word2)

  def eqn_parser(str) do
    _eqn_parser(str, 0, 0, '')
  end

  defp _eqn_parser('', num1, num2, op) when num1 >= 0 and num2 >= 0 do
    case op do
      ?+ -> num1 + num2
      ?- -> num1 - num2
      ?* -> num1 * num2
      ?/ -> num1 / num2
      _ -> raise ArgumentError, message: "Invalid string"
    end
  end
  defp _eqn_parser([h|t], num1, num2, '') when h in ?0..?9 do
    _eqn_parser(t, num1*10 + (h - ?0), num2, '')
  end
  defp _eqn_parser([h|t], num1, num2, '') do
    _eqn_parser(t, num1, num2, h)
  end
  defp _eqn_parser([h|t], num1, num2, op) do
    _eqn_parser(t, num1, num2*10 + (h - ?0), op)
  end
  defp _eqn_parser(_, _, _, _), do: raise ArgumentError, message: "Invalid string"
end

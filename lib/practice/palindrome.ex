defmodule Practice.Palindrome do
  def eq?([], []) do
    true
  end

  def eq?([_first | _rest], []) do
    false
  end

  def eq?([], [_first | _rest]) do
    false
  end

  def eq?([this_first | this_rest], [that_first | that_rest]) do
    String.equivalent?(this_first, that_first) && eq?(this_rest, that_rest)
  end

  def palindrome?(str) do
    str
    |> String.split("")
    |> Enum.reverse()
    |> eq?(String.split(str, ""))
  end
end

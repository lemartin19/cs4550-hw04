defmodule Practice.PracticeTest do
  use ExUnit.Case
  import Practice

  test "double some numbers" do
    assert double(4) == 8
    assert double(3.5) == 7.0
    assert double(21) == 42
    assert double(0) == 0
  end

  test "factor some numbers" do
    assert factor(5) == [5]
    assert factor(8) == [2, 2, 2]
    assert factor(12) == [2, 2, 3]
    assert factor(61) == [61]
    assert factor(255) == [3, 5, 17]
    assert factor(226_037_113) == [3449, 65537]
    assert factor(1575) == [3, 3, 5, 5, 7]
  end

  test "evaluate some expressions" do
    assert calc("5") == 5
    assert calc("5 + 1") == 6
    assert calc("5 * 3") == 15
    assert calc("10 / 2") == 5
    assert calc("10 - 2") == 8
    assert calc("5 * 3 + 8") == 23
    assert calc("8 + 5 * 3") == 23
  end

  test "palindrome? some strings" do
    assert palindrome?("abba")
    assert not palindrome?("abbc")
    assert palindrome?("racecar")
    assert not palindrome?("elixir")
    assert palindrome?("a")
    assert palindrome?("")
    assert not palindrome?("ab")
  end
end

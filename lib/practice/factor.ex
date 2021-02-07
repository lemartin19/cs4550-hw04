defmodule Practice.Factor do
  def add_factors(num, f) do
    num
    |> div(f)
    |> factor(f)
    |> (fn (rest) ->  [f | rest] end).()
  end

  def factor(num, f) do
    cond do
      num == f ->
        [num]
      rem(num, f) == 0 ->
        add_factors(num, f)
      true ->
        factor(num, f + 1)
    end
  end

  def factor(num) do
    if rem(num, 2) == 0 do
      add_factors(num, 2)
    else
      factor(num, 3)
    end
  end
end

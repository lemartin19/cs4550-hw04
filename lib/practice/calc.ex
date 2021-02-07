defmodule Practice.Calc do
  def parse_float(text) do
    {num, _} = Float.parse(text)
    num
  end

  def find_op(expr, op) do
    Enum.find_index(expr, &String.equivalent?(&1, op))
  end

  def order_of_op(expr) do
    find_op(expr, "+") || find_op(expr, "-") || find_op(expr, "*") || find_op(expr, "/")
  end

  def tree_ops([val]) do
    parse_float(val)
  end

  def tree_ops(expr) do
    idx = order_of_op(expr)
    start = Enum.slice(expr, 0..(idx - 1))
    finish = Enum.slice(expr, (idx + 1)..Enum.count(expr))
    %{a: tree_ops(start), op: Enum.at(expr, idx), b: tree_ops(finish)}
  end

  def evaluate(%{a: a, op: op, b: b}) do
    doOp = fn
      "*" -> evaluate(a) * evaluate(b)
      "/" -> evaluate(a) / evaluate(b)
      "+" -> evaluate(a) + evaluate(b)
      "-" -> evaluate(a) - evaluate(b)
    end

    doOp.(op)
  end

  def evaluate(val) do
    val
  end

  def calc(expr) do
    expr
    |> String.split(~r/\s+/)
    |> tree_ops
    |> evaluate
  end
end

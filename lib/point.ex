defmodule Blockr.Point do
  def new(x, y) do
    {x, y}
  end

  def move_down({x, y}) do
    # {row + 1, col}
    {x, y + 1}
  end

  def move_left({x, y}) do
    case x > 1 do
      true -> {x - 1, y}
      false -> {x, y}
    end
  end

  def move_right({x, y}) do
    case x < 9 do
      true -> {x + 1, y}
      false -> {x, y}
    end
  end
end

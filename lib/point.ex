defmodule Point do
  def new(row, col) do
    {row, col}
  end

  def move_down({row, col}) do
    {row + 1, col}
  end

  def move_left({row, col}) do
    case col > 1 do
      true -> {row, col - 1}
      false -> {row, col}
    end
  end

  def move_right({row, col}) do
    case col < 9 do
      true -> {row, col + 1}
      false -> {row, col}
    end
  end
end

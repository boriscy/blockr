defmodule Shape do
  alias Point

  def move_down(points) do
    Enum.map(points, &Point.move_down/1)
  end

  def move_left(points) do
    Enum.map(points, &Point.move_left/1)
  end

  @spec max_col(Point.t()) :: integer
  def max_col(points) do
    {_, col} = points |> Enum.max(fn {_, x}, {_, x2} -> x > x2 end)
    col
  end

  @spec min_col(Point.t()) :: integer
  def min_col(points) do
    {_, col} = points |> Enum.max(fn {_, x}, {_, x2} -> x < x2 end)
    col
  end

  @spec max_row(Point.t()) :: integer
  def max_row(points) do
    {row, _} = points |> Enum.max(fn {y, _}, {y2, _} -> y > y2 end)
    row
  end

  def rotate(0, points) do
    points
  end

  def rotate(points, 90) do
    # max_x = Shape.max_col(points)
    min_x = Shape.min_col(points)
    min_y = Shape.min_row(points)
    max_y = Shape.max_row(points)

    Enum.map(points, fn {y, x} ->
      {x - min_x + min_y, max_y - y + min_x}
    end)
  end

  @spec min_row([Point.t()]) :: integer
  def min_row(points) do
    {row, _} = points |> Enum.max(fn {y, _}, {y2, _} -> y < y2 end)
    row
  end

  @spec flip_left_right(Point.t()) :: Point.t()
  def flip_left_right(points) do
    max_x = max_col(points)
    min_x = min_col(points)

    Enum.map(points, fn {y, x} ->
      {y, max_x - x + min_x}
    end)
  end

  @spec flip_top_bottom(Point.t()) :: Point.t()
  def flip_top_bottom(points) do
    {max_y, min_y} = {max_row(points), min_row(points)}

    Enum.map(points, fn {y, x} ->
      {max_y - y + min_y, x}
    end)
  end
end

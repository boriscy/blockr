defmodule Blockr.Shape do
  alias Blockr.Point

  @spec move_down([tuple()]) :: [tuple()]
  def move_down(points) do
    Enum.map(points, &Point.move_down/1)
  end

  @spec move_left([tuple()]) :: [tuple()]
  def move_left(points) do
    Enum.map(points, &Point.move_left/1)
  end

  @spec max_col([tuple()]) :: integer
  def max_col(points) do
    # {_, col} = points |> Enum.max(fn {_, x}, {_, x2} -> x > x2 end)
    {x, _} = points |> Enum.max(fn {x, _}, {x2, _} -> x > x2 end)
    x
  end

  @spec min_col([tuple()]) :: integer
  def min_col(points) do
    # {_, col} = points |> Enum.max(fn {_, x}, {_, x2} -> x < x2 end)
    {x, _} = points |> Enum.max(fn {x, _}, {x2, _} -> x < x2 end)
    x
  end

  @spec max_row([tuple()]) :: integer
  def max_row(points) do
    {_, y} = points |> Enum.max(fn {_, y}, {_, y2} -> y > y2 end)
    y
  end

  def rotate(0, points) do
    points
  end

  @spec rotate([tuple()], integer) :: [tuple()]
  def rotate(points, 90) do
    # max_x = Shape.max_col(points)
    min_x = min_col(points)
    min_y = min_row(points)
    max_y = max_row(points)

    Enum.map(points, fn {x, y} ->
      {x - min_x + min_y, max_y - y + min_x}
    end)
  end

  @spec min_row([tuple()]) :: integer
  def min_row(points) do
    {y, _} = points |> Enum.max(fn {_, y}, {_, y2} -> y < y2 end)
    y
  end

  @spec flip_left_right([tuple()]) :: [tuple()]
  def flip_left_right(points) do
    max_x = max_col(points)
    min_x = min_col(points)

    Enum.map(points, fn {x, y} ->
      {max_x - x + min_x, y}
    end)
  end

  @spec flip_top_bottom([tuple()]) :: [tuple()]
  def flip_top_bottom(points) do
    {max_y, min_y} = {max_row(points), min_row(points)}

    Enum.map(points, fn {y, x} ->
      {x, max_y - y + min_y}
    end)
  end
end

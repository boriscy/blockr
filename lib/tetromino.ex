defmodule Tetromino do
  defstruct name: :i,
            location: {1, 3},
            rotation: 0,
            color: :blue

  def new(tetro \\ %{}) do
    __MODULE__.__struct__(tetro)
  end

  def left(tetro) do
    %{tetro | location: Point.move_left(tetro.location)}
  end

  def right(tetro) do
    %{tetro | location: Point.move_right(tetro.location)}
  end

  def fall(tetro) do
    %{tetro | location: Point.move_down(tetro.location)}
  end

  def rotate_right(tetro) do
    %{tetro | rotation: Integer.mod(tetro.rotation + 90, 360)}
  end

  def to_group(%{shape: :t} = tetro) do
    [
      %{tetro | location: Point.move_down(tetro.location)},
      %{tetro | location: Point.move_down(Point.move_down(tetro.location))},
      %{tetro | location: Point.move_down(Point.move_down(Point.move_down(tetro.location)))}
    ]
  end

  """
  t Shape ***
           *

  L shape *
          *
          **

  J shape *
          *
         **

  I shape *
          *
          *
          *

  o shape **
          **

  s shape **
           **
  """
end

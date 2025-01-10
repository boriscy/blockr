defmodule Blockr.Tetromino do
  alias Blockr.{Point, Canvas, Tetromino}

  defstruct name: :i,
            location: {3, 1},
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
    %__MODULE__{tetro | location: Point.move_down(tetro.location)}
  end

  def rotate_right(tetro) do
    %__MODULE__{tetro | rotation: Integer.mod(tetro.rotation + 90, 360)}
  end

  # :t, 0
  # def to_group(%__MODULE__{name: :t, rotation: 0} = tetro) do
  #  Canvas.tetromino([Point.new(1, 5), Point.new(2, 5), Point.new(3, 5), Point.new(2, 6)])
  # end

  # :t, 0
  def to_group(%__MODULE__{name: :t, rotation: 0} = tetro) do
    %__MODULE__{tetro | location: Point.move_right(tetro.location)}
    {x, y} = tetro.location

    [
      Point.new(x, y),
      Point.new(x + 1, y),
      Point.new(x + 2, y),
      Point.new(x + 1, y + 1)
    ]
  end

  def to_group(%__MODULE__{name: :l, rotation: 0} = tetro) do
    %__MODULE__{tetro | location: Point.move_down(tetro.location)}
    {x, y} = tetro.location

    [
      Point.new(x, y),
      Point.new(x, y + 1),
      Point.new(x, y + 2),
      Point.new(x + 1, y + 2)
    ]
  end

  def to_group(%__MODULE__{name: :j, rotation: 0} = tetro) do
    %__MODULE__{tetro | location: Point.move_down(tetro.location)}
    {x, y} = tetro.location
    x = if x == 1, do: 2, else: x

    [
      Point.new(x, y),
      Point.new(x, y + 1),
      Point.new(x, y + 2),
      Point.new(x - 1, y + 2)
    ]
  end

  def to_group(%__MODULE__{name: :i, rotation: 0} = tetro) do
    %__MODULE__{tetro | location: Point.move_down(tetro.location)}
    {x, y} = tetro.location

    [
      Point.new(x, y),
      Point.new(x, y + 1),
      Point.new(x, y + 2),
      Point.new(x, y + 3)
    ]
  end

  def to_group(%__MODULE__{name: :s, rotation: 0} = tetro) do
    %__MODULE__{tetro | location: Point.move_down(tetro.location)}
    {x, y} = tetro.location

    x = if x > 6, do: 6, else: x

    [
      Point.new(x, y),
      Point.new(x + 1, y),
      Point.new(x + 1, y + 1),
      Point.new(x + 2, y + 1)
    ]
  end

  def to_group(%__MODULE__{name: :z, rotation: 0} = tetro) do
    %__MODULE__{tetro | location: Point.move_down(tetro.location)}
    {x, y} = tetro.location
    x = if x < 3, do: 3, else: x

    [
      Point.new(x, y),
      Point.new(x - 1, y),
      Point.new(x - 1, y + 1),
      Point.new(x - 2, y + 1)
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

defmodule PointTest do
  use ExUnit.Case

  test "move_down" do
    assert Point.move_down({1, 2}) == {2, 2}
  end

  test "move_left" do
    assert Point.move_left({1, 6}) == {1, 5}
  end

  test "move_left limit" do
    assert Point.move_left({1, 1}) == {1, 1}
  end

  test "move_right" do
    assert Point.move_right({1, 6}) == {1, 7}
  end

  test "move_right limit" do
    assert Point.move_right({1, 10}) == {1, 10}
  end
end

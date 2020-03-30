defmodule LifeTest do
  use ExUnit.Case
  doctest Life

  test "greets the world" do
    assert Life.hello() == :world
    assert :foo.bar(0) == 0
  end

  test "the spot is occupied or not" do
    map = [{:pos, 0,0}, {:pos, 1,0}]
    assert :world.is_occupied([], 0) == :false
    assert :world.is_occupied(map, {:pos, 0, 0}) == :true
    assert :world.is_occupied(map, {:pos, 100, 100}) == :false
  end

  test "position equality" do
    assert :world.pos_eq({:pos, 0, 0}, {:pos, 0, 0}) == :true
    assert :world.pos_eq({:pos, 0, 0}, {:pos, 1, 0}) == :false
  end
  
  test "point arithmetic" do
    assert :world.add_point({:pos, 0, 0}, {:pos, 0, 0}) == {:pos, 0, 0}
    assert :world.add_point({:pos, 0, 0}, {:pos, 1, 1}) == {:pos, 1, 1}
    assert :world.add_point({:pos, 1, 1}, {:pos, -1, -1}) == {:pos, 0, 0}
    assert :world.add_point({:pos, 1, 1}, {:pos, 1, 1}) == {:pos, 2, 2}
  end
end

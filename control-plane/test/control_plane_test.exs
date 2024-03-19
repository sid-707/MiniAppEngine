defmodule ControlPlaneTest do
  use ExUnit.Case
  doctest ControlPlane

  test "greets the world" do
    assert ControlPlane.hello() == :world
  end
end

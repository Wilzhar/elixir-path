defmodule PlugProjectTest do
  use ExUnit.Case
  doctest PlugProject

  test "greets the world" do
    assert PlugProject.hello() == :world
  end
end

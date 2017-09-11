defmodule RedisPoolTest do
  use ExUnit.Case
  doctest RedisPool

  test "greets the world" do
    assert RedisPool.hello() == :world
  end
end

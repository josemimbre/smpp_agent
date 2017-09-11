defmodule SmppSenderTest do
  use ExUnit.Case
  doctest SmppSender

  test "greets the world" do
    assert SmppSender.hello() == :world
  end
end

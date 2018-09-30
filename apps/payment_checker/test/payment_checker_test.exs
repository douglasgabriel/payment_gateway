defmodule PaymentCheckerTest do
  use ExUnit.Case
  doctest PaymentChecker

  test "greets the world" do
    assert PaymentChecker.hello() == :world
  end
end

# mix test test/wander/hubs/hub_test.ex
defmodule Wander.HubTest do
  use ExUnit.Case, async: true
  doctest Wander.Hub

  test "Cannot convert a string to an unknown atom" do
    assert Wander.Hub.to_existing_atom("UN:KN:OW:NN") == {false}
  end

  test "Can convert a string to an known atom" do
    String.to_atom("KN:OW:NN")
    assert Wander.Hub.to_existing_atom("KN:OW:NN") == {true, :"KN:OW:NN" }
    assert Wander.Hub.to_existing_atom("KN:OW:NN") == {true, :"KN:OW:NN" }
  end

end  
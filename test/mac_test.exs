defmodule MacTest do
  use ExUnit.Case, async: false
  use ExCheck
  doctest Wander

  # Convert byte to 2-digit hexadecimal string
  # http://stackoverflow.com/a/9469430
  def hex(b) do
    :io.format('~2.16.0B~n',[abs(b)])
  end

  def mac_of_ints(bs) do
    Enum.map(bs, fn b -> hex(b) end) |> Enum.join(":")
  end

  property :strings_are_not_mac_addresses do
    for_all s in unicode_string do
      Wander.valid_mac_48?(s) == false
    end
  end

  @tag iterations: 30
  property :valid_mac_addresses do
    for_all bs in list(int) do
       # TODO such that we have 6 integers
       IO.puts(mac_of_ints(bs))  
       Wander.valid_mac_48?(mac_of_ints(bs)) == true
    end
  end

  test "empty mac address" do
    assert Wander.valid_mac_48?("00:00:00:00:00:00") == true
  end

  test "short mac address" do
    assert Wander.valid_mac_48?("00:00:00:00:00") == false
  end

  test "empty string" do
    assert Wander.valid_mac_48?("") == false
  end

end
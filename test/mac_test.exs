defmodule MacTest do
  use ExUnit.Case, async: false
  use ExCheck
  doctest Wander

  # Convert byte to 2-digit hexadecimal string
  # http://stackoverflow.com/a/9469430
  def hex(b) do
    :io.format('~2.16.0B~n',[abs(b)])
  end

  # Convert a list of numbers into six groups
  # of two hexadecimal digits
  def mac_of_ints(bs) do
    Enum.map(bs, fn b -> hex(b) end) |> Enum.join(":")
  end

  # Most random strings will not be MAC addresses (mostly)
  property :strings_are_not_mac_addresses do
    for_all s in unicode_string do
      assert Wander.valid_mac_48?(s) == false
    end
  end

  # Any list of 6 bytes should be a valid MAC address
  @tag iterations: 300
  property :valid_mac_addresses do
    for_all {a,b,c,d,e,f} in {byte,byte,byte,byte,byte,byte}  do
       assert Wander.valid_mac_48?(mac_of_ints([a,b,c,d,e,f])) == true
    end
  end

  test "zero mac address is valid" do
    assert Wander.valid_mac_48?("00:00:00:00:00:00") == true
  end

  test "short mac address is invalid" do
    assert Wander.valid_mac_48?("00:00:00:00:00") == false
  end

  test "empty string is invalid" do
    assert Wander.valid_mac_48?("") == false
  end

end
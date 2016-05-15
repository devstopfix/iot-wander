#
# Verify the MAC address functions.
#
# This is a lot of code to test a one-line function however this is my
# first Elixir module and the first use of ExCheck.
#
defmodule IEEE.MacTest do
  use ExUnit.Case, async: true
  use ExCheck
  doctest IEEE.MAC

  # Helper functions only for the test cases

  # Convert byte to 2-digit hexadecimal string
  #   10 -> "0A"
  def hex(b) do
    b
     |> Integer.to_string(16)
     |> String.rjust(2, ?0)
  end

  # Test we can convert from bytes to hex and back
  property :hex_round_trip do
    for_all b in byte do
      s16 = hex(b)
      assert String.length(s16) == 2
      assert elem(Integer.parse(s16, 16), 0) === b
    end
  end

  # Convert a list of bytes into a string of two hexadecimal digits
  # separated by colons
  def mac_of_bytes(bs) do
    bs
      |> Enum.map(fn b -> hex(b) end)
      |> Enum.join(":")
  end

  # MAC Property Tests

  # Most random strings will not be MAC addresses (mostly)
  property :strings_are_not_mac_addresses do
    for_all s in unicode_string do
      assert IEEE.MAC.valid_mac_48?(Enum.join(s)) == false, s
      # TODO use refute here, but getting:
      #      Expected truthy, got false
    end
  end

  # Any list of 6 bytes should be a valid MAC address
  property :valid_mac_addresses do
    for_all {a, b, c, d, e, f} in {byte, byte, byte, byte, byte, byte} do
      s = mac_of_bytes([a, b, c, d, e, f])
      assert IEEE.MAC.valid_mac_48?(s), s
    end
  end

  # Valid MAC 48 addresses are 6 bytes long
  # Invalid MAC 48 addresses are not 6 bytes long
  @tag iterations: 1000
  property :some_valid_mac_addresses do
    for_all bs in list(byte) do
      mac = mac_of_bytes(bs)
      assert IEEE.MAC.valid_mac_48?(mac) == ((length bs) == 6), mac
    end
  end

  # Unit tests

  test "zero mac address is valid" do
    assert IEEE.MAC.valid_mac_48?("00:00:00:00:00:00")
  end

  test "non-hexadecimal mac address is invalid" do
    refute IEEE.MAC.valid_mac_48?("0K:00:00:00:00:00")
  end

  test "short mac address is invalid" do
    refute IEEE.MAC.valid_mac_48?("00:00:00:00:00")
  end

  test "long mac address is invalid" do
    refute IEEE.MAC.valid_mac_48?("00:00:00:00:00:000")
  end

  test "empty string is invalid" do
    refute IEEE.MAC.valid_mac_48?("")
  end

end

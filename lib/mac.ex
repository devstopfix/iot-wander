defmodule MAC do
  @moduledoc """
  Functions for working with MAC Addresses
  See https://en.wikipedia.org/wiki/MAC_address
  """

  @doc """
  Return true iff the entire string is a valid MAC 48 address.

  Expects a String that is a 48-bit MAC address encoded as
  six hexadecimal pairs separated by colons.

  ## Example

      iex> MAC.valid_mac_48?("01:23:45:67:89:AB")
      true
  """
  def valid_mac_48?(mac) do
    Regex.match?(~r/^[0-9A-F]{2}(:[0-9A-F]{2}){5}$/, mac)
  end

end
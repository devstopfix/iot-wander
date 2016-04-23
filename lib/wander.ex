defmodule Wander do

  # Return true iff the entire string is a valid MAC 48 address
  def valid_mac_48?(mac) do
    Regex.match?(~r/^[0-9A-F]{2}(:[0-9A-F]{2}){5}$/, mac)
  end

end

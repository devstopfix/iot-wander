defmodule Wander do

  def valid_mac_48?(mac) do
    mac48 = ~r/[0-9A-F]{2}(:[0-9A-F]{2}){5}/
    mac =~ mac48
  end

end

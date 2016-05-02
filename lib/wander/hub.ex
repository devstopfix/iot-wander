defmodule Wander.Hub do
  use GenServer

  @moduledoc """
  HUBs are the gateway between Things and the Wander platform.
  Clients are HUBs that POST data. Each client HUB is a process. 

  HUB processess authenticate requests and delegate processing to Things.
  """

  @doc """
  Echance `String.to_existing_atom` to return a tuple
  and not throw an Exception. Converts string to its
  corresponding atom but only if it already exists.
  """
  def to_existing_atom(s) do
    try do
      {true, String.to_existing_atom(s) }
    rescue
      _ in ArgumentError -> {false}
    end
  end

  @doc """
  Spawn a new process that receives updates from a Hub
  with the given MAC address.
  The server process is registered as the Atom of the MAC address,
  which must be valid.
  """
  def start(mac48) do
    if IEEE.MAC.valid_mac_48?(mac48) do
      hub = String.to_atom(mac48);
      GenServer.start_link(Wander.Hub, {:mac, mac48}, name: hub);
      # TODO supervisor with a restart strategy of simple_one_for_one
    end
  end

  def handle_call(:update, _from, state) do
    IO.puts("Received.");
    {:reply, :ok, state}
  end

  def handle_call(_any, _from, state) do
    {:reply, :ignored, state}
  end

  # {:ok, pid } = Wander.Hub.start("01:02:03:04:05:06")
  # Process.alive?(pid)
  #
  # GenServer.call(pid, :update)
  # GenServer.call(String.to_atom("01:02:03:04:05:06"), :update)
  # GenServer.call(:"01:02:03:04:05:06", :update) 
end
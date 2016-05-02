defmodule Wander.Hub do
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
  """
  def start(mac) do
    spawn(Wander.Hub, :loop, [])
  end

  def update() do
    IO.puts("Received.")
  end

  def loop() do
    receive do
      {:update} -> 
        update()
        loop();
      {:terminate} -> 
        nil;
      Any ->
        loop();
    end
  end

  #  pid = Wander.Hubs.Hub.start("")
  #  send(pid, {:update})

end
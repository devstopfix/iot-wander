defmodule Wander.Hubs.Hub do
  @moduledoc """
  HUBs are the gateway between Things and the Wander platform.
  Clients are HUBs that POST data. Each client HUB is a process. 

  HUB processess authenticate requests and delegate processing to Things.
  """

  @doc """
  Echance `String.to_existing_atom` to return a tuple
  and not throw an Exception.
  """
  def to_existing_atom(s) do
    try do
      {true, String.to_existing_atom(s) }
    rescue
      e in ArgumentError -> {false}
    end
  end

end
defmodule Hub.Supervisor do
  use Supervisor

  @moduledoc """
  This Supervisor is responsible for starting a single process
  per Hub, where a Hub is uniquely identified by it's MAC address.
  Should a Hub crash, it is restarted and it's state will be
  replenished by the next data event.
  """

  def start_link do
    Supervisor.start_link(__MODULE__, [], name: :hub_supervisor)
  end

  def start_hub(name) do
    Supervisor.start_child(:hub_supervisor, [name])
  end

  def init(_) do
    children = [
      worker(Hub.Server, [])
    ]

    supervise(children, strategy: :simple_one_for_one)
  end

end

defmodule Wander.API.App do
  use Application

  @moduledoc """
  The Wander IoT application. Responsible for starting all the processes.
  """

  defp start_hubs(hubs) do
    Hub.Supervisor.start_link
    Enum.each(hubs, fn(hub) -> Hub.Supervisor.start_hub(hub) end)
  end

  def start(_type, _args) do
    port = Application.get_env(:concoction, :cowboy_port, 4000)

    children = [
      Plug.Adapters.Cowboy.child_spec(:http, Wander.API.Router, [], port: port)
    ]

    start_hubs(["01:23:45:67:89:AB"])

    Supervisor.start_link(children, strategy: :one_for_one)

  end

end

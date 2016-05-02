defmodule Wander.API.App do
  use Application

  defp start_hubs(hubs) do
    Enum.each(hubs, fn(hub) -> Wander.Hub.start(hub) end)
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
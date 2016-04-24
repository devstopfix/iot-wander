defmodule WanderApp do
  use Application

  def start(_type, _args) do
    port = Application.get_env(:concoction, :cowboy_port, 4000)

    children = [
      Plug.Adapters.Cowboy.child_spec(:http, AppRouter, [], port: port)
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
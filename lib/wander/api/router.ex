defmodule Wander.API.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  post "/hub/:mac" do
    send_resp(conn, 202, "Accepted")
  end

  @routes_msg "Routes: " <> Enum.join(["/hub"])

  match _ do
    send_resp(conn, 400, @routes_msg)
  end

end
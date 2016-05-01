defmodule Wander.API.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  post "/hub/:mac" do
    if IEEE.MAC.valid_mac_48?(mac) do
      send_resp(conn, 202, "Accepted")
    else
      send_resp(conn, 400, "Invalid MAC-48")
    end
  end

  @routes_msg "Routes: " <> Enum.join(["/hub"])

  match _ do
    send_resp(conn, 400, @routes_msg)
  end

end
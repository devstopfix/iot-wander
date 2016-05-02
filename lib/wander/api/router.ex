defmodule Wander.API.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  post "/hub/:mac" do
    if IEEE.MAC.valid_mac_48?(mac) do
      case Wander.Hub.to_existing_atom(mac) do
        {true, _} -> 
          send_resp(conn, 202, "Accepted");
        {false}   -> 
          send_resp(conn, 404, "Hub Not Found");
      end
    else
      send_resp(conn, 400, "Invalid MAC-48")
    end
  end

  match _ do
    send_resp(conn, 400, "Unknown URL")
  end

end
defmodule WanderPlug do
  import Plug.Conn

  @moduledoc """
  The HTTP RESTful API for the IoT Wander application.
  """  

  def init(options) do
    # initialize options

    options
  end

  def call(conn, _opts) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Hello world")
  end
end
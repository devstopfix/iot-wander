# mix test test/wander/api/api_test.exs
defmodule Wander.API.APITest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts Wander.API.Router.init([])

  test "returns hello world" do
    # Create a test connection
    conn = conn(:get, "/hello")

    # Invoke the plug
    conn = Wander.API.Router.call(conn, @opts)

    # Assert the response and status
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "Welcome"
  end

  test "invalid route" do
    # Create a test connection
    conn = conn(:get, "/other")

    # Invoke the plug
    conn = Wander.API.Router.call(conn, @opts)

    # Assert the response and status
    assert conn.state == :sent
    assert conn.status == 404
    assert conn.resp_body == "oops"
  end

end
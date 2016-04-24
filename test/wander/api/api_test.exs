# mix test test/wander/api/api_test.exs
defmodule Wander.API.APITest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts Wander.API.Router.init([])

  # Valid hub

  test "can POST to a hub" do
    conn = conn(:post, "/hub/01:23:45:67:89:AB")
    conn = Wander.API.Router.call(conn, @opts)
    assert conn.state == :sent
    assert conn.status == 202
    assert conn.resp_body == "Accepted"
  end

  # Invalid hub

  test "cannot POST to an invalid MAC address" do
    conn = conn(:post, "/hub/0G:00:45:67:89:AB")
    conn = Wander.API.Router.call(conn, @opts)
    assert conn.state == :sent
    assert conn.status == 400
    assert conn.resp_body == "Invalid MAC-48 address"
  end

  test "cannot POST to root of hub" do
    conn = conn(:post, "/hub")
    conn = Wander.API.Router.call(conn, @opts)
    assert conn.state == :sent
    assert conn.status == 400
    assert conn.resp_body == "Routes: /hub"
  end

  # Other routes

  test "invalid route gives 400 Bad Request" do
    conn = conn(:get, "/other")
    conn = Wander.API.Router.call(conn, @opts)
    assert conn.state == :sent
    assert conn.status == 400
    assert conn.resp_body == "Routes: /hub"
  end

  test "root gives 400 Bad Request" do
    conn = conn(:get, "/")
    conn = Wander.API.Router.call(conn, @opts)
    assert conn.state == :sent
    assert conn.status == 400
    assert conn.resp_body == "Routes: /hub"
  end

end
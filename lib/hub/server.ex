defmodule Hub.Server do
  use GenServer

  @moduledoc """
  A Hub process maintains the latest state broadcast from the
  physical Hub device.
  """

  def start_link(mac) do
    GenServer.start_link(__MODULE__, now(), name: via_tuple(mac))
  end

  defp identify(mac) do
    {:n, :l, {:hub, mac}}
  end

  # Generate a locally scoped(:l), unique name (:n) for a Hub
  defp via_tuple(mac) do
    {:via, :gproc, identify(mac)}
  end

  def publish(mac, message) do
    case :gproc.where(identify(mac)) do
      :undefined -> :not_found
      _pid       -> GenServer.call(via_tuple(mac), {:publish, message})
    end
  end

  # def get_messages(mac) do
  #   GenServer.call(via_tuple(mac), :get_messages)
  # end

  # SERVER

  def init(messages) do
    {:ok, messages}
  end

  def handle_call({:publish, new_message}, _from, _old_t) do
    {:reply, :ok, now()}
  end

  # def handle_call(:get_messages, _from, messages) do
  #   {:reply, messages, messages}
  # end

  # Util

  def now do
    :calendar.universal_time()
  end

end

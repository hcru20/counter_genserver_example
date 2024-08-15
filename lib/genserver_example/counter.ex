defmodule Counter do
  use GenServer

  # Client API

  # Starts the GenServer
  def start_link(initial_count \\ 0) do
    GenServer.start_link(__MODULE__, initial_count, name: __MODULE__)
  end

  # Synchronous call to get the current count
  def get_count do
    GenServer.call(__MODULE__, :get_count)
  end

  # Asynchronous call to increment the count
  def increment do
    GenServer.cast(__MODULE__, :increment)
  end

  # Asynchronous call to decrement the count
  def decrement do
    GenServer.cast(__MODULE__, :decrement)
  end

  # Asynchronous call to reset the count to zero
  def reset do
    GenServer.cast(__MODULE__, :reset)
  end

  # Server (callbacks)

  # Initial state of the GenServer
  def init(initial_count) do
    {:ok, initial_count}
  end

  # Handling synchronous calls
  def handle_call(:get_count, _from, count) do
    {:reply, count, count}
  end

  # Handling asynchronous calls
  def handle_cast(:increment, count) do
    {:noreply, count + 1}
  end

  def handle_cast(:decrement, count) do
    {:noreply, count - 1}
  end

  def handle_cast(:reset, _count) do
    {:noreply, 0}
  end
end


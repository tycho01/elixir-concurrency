defmodule CounterAgent do
  def new do
    Agent.start_link(fn -> 0 end)
  end

  def click(pid) do
    Agent.get_and_update(pid, fn(n) -> {n + 1, n + 1} end)
  end

  def set(pid, new_value) do
    Agent.update(pid, fn(_n) -> new_value end)
  end

  def get(pid) do
    Agent.get(pid, fn(n) -> n end)
  end

  def sleep_server(pid) do
    Agent.get(pid, fn n -> :timer.sleep(1000); n end)
  end

  def sleep_client(pid) do
    n = Agent.get(pid, &(&1)); :timer.sleep(1000); n
  end

end

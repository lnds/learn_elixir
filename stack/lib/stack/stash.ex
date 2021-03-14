defmodule Stack.Stash do
  use GenServer

  @me __MODULE__

  def start_link(stack) do
    GenServer.start_link(__MODULE__, stack, name: @me)
  end

  def get() do
    GenServer.call(@me, {:get})
  end

  def update(new_stack) do
    GenServer.cast(@me, {:update, new_stack})
  end

  # server implementation
  
  def init(stack) do
    {:ok, stack}
  end

  def handle_call({:get}, _from, current_stack) do
    {:reply, current_stack, current_stack}
  end

  def handle_cast({:update, new_stack}, _current_stack) do
    {:noreply, new_stack}
  end
end


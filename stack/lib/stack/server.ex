defmodule Stack.Server do
  use GenServer

  # External API
  #

  def start_link(stack) do
    GenServer.start_link(__MODULE__, stack, name: __MODULE__)
  end

  def pop do
    GenServer.call __MODULE__, :pop
  end

  def push(elem) do
    GenServer.cast __MODULE__, {:push, elem}
  end

  # implementation

  def init(initial_list) do
    {:ok, Stack.Stash.get()}
  end

  def handle_call(:pop, _from, [head|tail]) do
    {:reply, head, tail}
  end

  def handle_cast({:push, elem}, list) do
    {:noreply, [elem|list]}
  end

  def terminate(_reason, current_stack) do
    Stack.Stash.update(current_stack)
  end

end

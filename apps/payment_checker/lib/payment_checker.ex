defmodule PaymentChecker do
  use GenServer
  alias PaymentChecker.EthereumChecker.Checker

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    schedule_work()
    {:ok, state}
  end

  def handle_info(:work, state) do
    Checker.check_payments
    schedule_work()
    {:noreply, state}
  end

  defp schedule_work() do
    Process.send_after(self(), :work, 60 * 1000)
  end
end

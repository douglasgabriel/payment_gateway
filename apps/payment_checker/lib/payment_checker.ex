defmodule PaymentChecker do
  @moduledoc """
  Runs PaymentChecker.EthereumChecker.Checker.check_payments/0
  every time after a amount of time
  """

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
    schedule_check_time = 1000 # one second

    Process.send_after(self(), :work, schedule_check_time)
  end
end

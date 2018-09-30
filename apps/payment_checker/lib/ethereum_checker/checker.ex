defmodule PaymentChecker.EthereumChecker.Checker do
  @moduledoc """
  Checks payments status against Etherscan API
  """

  alias Core.Management.Payments
  alias EthereumService.Etherscan.Transaction

  @doc """
  Checks unconfirmed payments status
  """
  def check_payments do
    for payment <- Payments.get_unconfirmed do
      case Transaction.get_txreceipt_status(payment.txhash) do
        :ok ->
          Payments.update(payment, %{status: "OK"})
        :error ->
          Payments.update(payment, %{status: "ERROR"})
        _ ->
          nil
      end
    end
  end
end

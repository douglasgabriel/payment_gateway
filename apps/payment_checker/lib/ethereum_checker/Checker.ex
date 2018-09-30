defmodule PaymentChecker.EthereumChecker.Checker do
  alias Core.Management.Payments
  alias EthereumService.Etherscan.Transaction

  def check_payments do
    for payment <- Payments.get_unconfirmed do
      case Transaction.get_txreceipt_status(payment.txhash) do
        :ok ->
          Payments.update(%{status: "OK"})
        :error ->
          Payments.update(%{status: "ERROR"})
        _ ->
          nil
      end
    end
  end
end
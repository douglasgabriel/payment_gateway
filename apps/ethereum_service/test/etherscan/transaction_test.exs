defmodule EthereumService.Etherscan.TransactionTest do
  use ExUnit.Case
  import Mock

  alias EthereumService.Etherscan.Client
  alias EthereumService.Etherscan.Transaction

  doctest EthereumService.Etherscan.Transaction

  test "Getting receipt status for a confirmed TXHash" do
    extherscan_confirmed_response = %{"message" => "OK", "result" => %{"status" => "1"}, "status" => "1"}

    with_mock Client, [
      request: fn(_, _) -> {:ok, extherscan_confirmed_response} end
    ] do
      status = Transaction.get_txreceipt_status("txhash")

      assert :ok == status
    end
  end

  test "Getting receipt status for a errored TXHash" do
    extherscan_errored_response = %{"message" => "OK", "result" => %{"status" => "0"}, "status" => "1"}

    with_mock Client, [
      request: fn(_, _) -> {:ok, extherscan_errored_response} end
    ] do
      status = Transaction.get_txreceipt_status("txhash")

      assert :error == status
    end
  end
end

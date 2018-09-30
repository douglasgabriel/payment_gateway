defmodule PaymentChecker.EthereumChecker.CheckerTest do
  use ExUnit.Case
  import Mock

  alias PaymentChecker.EthereumChecker.Checker
  alias Core.Management.Payments
  alias EthereumService.Etherscan.Transaction

  doctest Checker

  test "Checking payment with OK status" do
    {:ok, payment} = Payments.create(%{txhash: "test"})

    with_mock Transaction, [
      get_txreceipt_status: fn(_) -> :ok end
    ] do
      Checker.check_payments
    end

    assert "OK" == Payments.find(payment.id).status
  end

  test "Checking payment with ERROR status" do
    {:ok, payment} = Payments.create(%{txhash: "test"})

    with_mock Transaction, [
      get_txreceipt_status: fn(_) -> :error end
    ] do
      Checker.check_payments
    end

    assert "ERROR" == Payments.find(payment.id).status
  end

  test "Checking payment with undefined status" do
    {:ok, payment} = Payments.create(%{txhash: "test"})

    with_mock Transaction, [
      get_txreceipt_status: fn(_) -> :undefined end
    ] do
      Checker.check_payments
    end

    assert nil == Payments.find(payment.id).status
  end
end

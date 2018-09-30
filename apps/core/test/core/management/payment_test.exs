defmodule Core.Management.PaymentManagementTest do
  use ExUnit.Case
  alias Core.Management.Payments
  alias Core.Repo

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  test "Creating a new Payment" do
    assert [] == Payments.all

    Payments.create(%{ txhash: "test" })

    assert 1 == length(Payments.all)
  end

  test "Finding a Payment by ID" do
    {:ok, payment} = Payments.create(%{ txhash: "test" })

    assert payment == Payments.find(payment.id)
  end

  test "Getting unconfirmed payments" do
    Payments.create(%{ txhash: "confirmed",   status: "OK" })
    Payments.create(%{ txhash: "confirmed",   status: "ERROR" })
    Payments.create(%{ txhash: "unconfirmed", status: nil })

    assert 1 == length(Payments.get_unconfirmed)
  end

  test "Updating a payment" do
    txhash_on_create = "test"
    txhash_on_update = "updated"

    {:ok, payment} = Payments.create(%{ txhash: txhash_on_create })

    assert txhash_on_create == Payments.find(payment.id).txhash

    Payments.update(payment, %{ txhash: txhash_on_update })

    assert txhash_on_update == Payments.find(payment.id).txhash
  end
end
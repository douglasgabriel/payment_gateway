defmodule Core.Management.Payments do
  @moduledoc """
  Provides functions to manage Payments
  """

  import Ecto.Query, warn: false
  alias Core.Repo
  alias Core.Schemas.Payment

  @doc """
  Returns the payment identified by the given `id`
  """
  def find(id) do
    Repo.get!(Payment, id)
  end

  @doc """
  Returns all payments with `:status` nil
  """
  def get_unconfirmed do
    (from p in Payment,
      where: is_nil(p.status))
    |> Repo.all
  end

  @doc """
  Returns all payments
  """
  def all do
    Repo.all(Payment)
  end

  @doc """
  Creates a new payment

  Returns `{ :ok, payment }
  """
  def create(params) do
    cs = Payment.changeset(%Payment{}, params)

    if cs.valid? do
      Repo.insert(cs)
    else
      cs
    end
  end

  @doc """
  Updates an existent payment

  Returns `{ :ok, payment }
  """
  def update(payment, params) do
    cs = Payment.changeset(payment, params)
    if cs.valid? do
      Repo.update(cs)
    else
      cs
    end
  end
end

defmodule Core.Management.Payments do
  import Ecto.Query, warn: false
  alias Core.Repo
  alias Core.Schemas.Payment

  def find(id) do
    Repo.get!(Payment, id)
  end

  def get_unconfirmed do
    (from p in Payment,
      where: is_nil(p.status))
    |> Repo.all
  end

  def all do
    Repo.all(Payment)
  end

  def create(params) do
    cs = Payment.changeset(%Payment{}, params)

    if cs.valid? do
      Repo.insert(cs)
    else
      cs
    end
  end

  def update(params) do
    cs = Payment.changeset(%Payment{}, params)

    if cs.valid? do
      Repo.update(cs)
    else
      cs
    end
  end
end
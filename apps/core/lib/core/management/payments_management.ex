defmodule Core.Management.Payments do
  import Ecto.Query, warn: false
  alias Core.Repo
  alias Core.Schemas.Payment

  def find(id) do
    Repo.get!(Payment, id)
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
end
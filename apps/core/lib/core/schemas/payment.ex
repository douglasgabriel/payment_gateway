defmodule Core.Schemas.Payment do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset
  alias Core.Schemas.Payment

  @primary_key {:id, :id, autogenerate: true}
  schema "payments" do
    field :txhash, :string
    field :status, :string

    timestamps
  end

  @fields ~w(txhash status)

  def changeset(%Payment{} = payment, attrs) do
    payment
    |> cast(attrs, @fields)
    |> validate_required([:txhash])
  end
end

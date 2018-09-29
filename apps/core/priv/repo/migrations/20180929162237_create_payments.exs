defmodule Core.Repo.Migrations.CreatePayments do
  use Ecto.Migration

  def change do
    create table(:payments) do
      add :txhash, :string
      add :status, :string

      timestamps
    end
  end
end

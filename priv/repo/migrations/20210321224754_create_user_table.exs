defmodule Rocketpay.Repo.Migrations.CreateUserTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :age, :integer
      add :email, :string
      add :password_hash, :string
      add :nickname, :string

      timestamps()
    end

    create unique_index(:users, [:email])
    create unique_index(:users, [:nickname])
  end

  # comandos na migração
  #def up do
  #end

  # comandos ao fazer rollback
  #def down do
  #end
end

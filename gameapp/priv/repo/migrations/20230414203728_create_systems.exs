defmodule Gameapp.Repo.Migrations.CreateSystems do
  use Ecto.Migration

  def change do
    create table(:systems) do
      add :name, :string
      add :maker, :string

      timestamps()
    end
  end
end

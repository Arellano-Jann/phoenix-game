defmodule Gameapp.Database.Game do
  use Ecto.Schema
  import Ecto.Changeset

  schema "games" do
    field :description, :string
    field :name, :string
    field :system_id, :id
    field :brand_id, :id

    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end

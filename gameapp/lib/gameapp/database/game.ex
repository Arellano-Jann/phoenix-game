defmodule Gameapp.Database.Game do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gameapp.Database.System
  alias Gameapp.Database.Brand

  schema "games" do
    field :description, :string
    field :name, :string
    belongs_to :system, System
    belongs_to :brand, Brand


    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:name, :description, :system_id, :brand_id])
    |> validate_required([:name, :description, :system_id, :brand_id])
  end
end

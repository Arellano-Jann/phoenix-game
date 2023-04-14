defmodule Gameapp.Database.System do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gameapp.Database.Game

  schema "systems" do
    field :maker, :string
    field :name, :string
    has_many :games, Game

    timestamps()
  end

  @doc false
  def changeset(system, attrs) do
    system
    |> cast(attrs, [:name, :maker])
    |> validate_required([:name, :maker])
  end
end

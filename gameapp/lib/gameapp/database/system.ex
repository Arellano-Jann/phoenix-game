defmodule Gameapp.Database.System do
  use Ecto.Schema
  import Ecto.Changeset

  schema "systems" do
    field :maker, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(system, attrs) do
    system
    |> cast(attrs, [:name, :maker])
    |> validate_required([:name, :maker])
  end
end

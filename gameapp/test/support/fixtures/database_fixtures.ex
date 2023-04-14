defmodule Gameapp.DatabaseFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Gameapp.Database` context.
  """

  @doc """
  Generate a system.
  """
  def system_fixture(attrs \\ %{}) do
    {:ok, system} =
      attrs
      |> Enum.into(%{
        maker: "some maker",
        name: "some name"
      })
      |> Gameapp.Database.create_system()

    system
  end

  @doc """
  Generate a brand.
  """
  def brand_fixture(attrs \\ %{}) do
    {:ok, brand} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Gameapp.Database.create_brand()

    brand
  end

  @doc """
  Generate a game.
  """
  def game_fixture(attrs \\ %{}) do
    {:ok, game} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> Gameapp.Database.create_game()

    game
  end
end

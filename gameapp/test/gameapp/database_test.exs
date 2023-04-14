defmodule Gameapp.DatabaseTest do
  use Gameapp.DataCase

  alias Gameapp.Database

  describe "systems" do
    alias Gameapp.Database.System

    import Gameapp.DatabaseFixtures

    @invalid_attrs %{maker: nil, name: nil}

    test "list_systems/0 returns all systems" do
      system = system_fixture()
      assert Database.list_systems() == [system]
    end

    test "get_system!/1 returns the system with given id" do
      system = system_fixture()
      assert Database.get_system!(system.id) == system
    end

    test "create_system/1 with valid data creates a system" do
      valid_attrs = %{maker: "some maker", name: "some name"}

      assert {:ok, %System{} = system} = Database.create_system(valid_attrs)
      assert system.maker == "some maker"
      assert system.name == "some name"
    end

    test "create_system/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Database.create_system(@invalid_attrs)
    end

    test "update_system/2 with valid data updates the system" do
      system = system_fixture()
      update_attrs = %{maker: "some updated maker", name: "some updated name"}

      assert {:ok, %System{} = system} = Database.update_system(system, update_attrs)
      assert system.maker == "some updated maker"
      assert system.name == "some updated name"
    end

    test "update_system/2 with invalid data returns error changeset" do
      system = system_fixture()
      assert {:error, %Ecto.Changeset{}} = Database.update_system(system, @invalid_attrs)
      assert system == Database.get_system!(system.id)
    end

    test "delete_system/1 deletes the system" do
      system = system_fixture()
      assert {:ok, %System{}} = Database.delete_system(system)
      assert_raise Ecto.NoResultsError, fn -> Database.get_system!(system.id) end
    end

    test "change_system/1 returns a system changeset" do
      system = system_fixture()
      assert %Ecto.Changeset{} = Database.change_system(system)
    end
  end

  describe "brands" do
    alias Gameapp.Database.Brand

    import Gameapp.DatabaseFixtures

    @invalid_attrs %{name: nil}

    test "list_brands/0 returns all brands" do
      brand = brand_fixture()
      assert Database.list_brands() == [brand]
    end

    test "get_brand!/1 returns the brand with given id" do
      brand = brand_fixture()
      assert Database.get_brand!(brand.id) == brand
    end

    test "create_brand/1 with valid data creates a brand" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Brand{} = brand} = Database.create_brand(valid_attrs)
      assert brand.name == "some name"
    end

    test "create_brand/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Database.create_brand(@invalid_attrs)
    end

    test "update_brand/2 with valid data updates the brand" do
      brand = brand_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Brand{} = brand} = Database.update_brand(brand, update_attrs)
      assert brand.name == "some updated name"
    end

    test "update_brand/2 with invalid data returns error changeset" do
      brand = brand_fixture()
      assert {:error, %Ecto.Changeset{}} = Database.update_brand(brand, @invalid_attrs)
      assert brand == Database.get_brand!(brand.id)
    end

    test "delete_brand/1 deletes the brand" do
      brand = brand_fixture()
      assert {:ok, %Brand{}} = Database.delete_brand(brand)
      assert_raise Ecto.NoResultsError, fn -> Database.get_brand!(brand.id) end
    end

    test "change_brand/1 returns a brand changeset" do
      brand = brand_fixture()
      assert %Ecto.Changeset{} = Database.change_brand(brand)
    end
  end

  describe "games" do
    alias Gameapp.Database.Game

    import Gameapp.DatabaseFixtures

    @invalid_attrs %{description: nil, name: nil}

    test "list_games/0 returns all games" do
      game = game_fixture()
      assert Database.list_games() == [game]
    end

    test "get_game!/1 returns the game with given id" do
      game = game_fixture()
      assert Database.get_game!(game.id) == game
    end

    test "create_game/1 with valid data creates a game" do
      valid_attrs = %{description: "some description", name: "some name"}

      assert {:ok, %Game{} = game} = Database.create_game(valid_attrs)
      assert game.description == "some description"
      assert game.name == "some name"
    end

    test "create_game/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Database.create_game(@invalid_attrs)
    end

    test "update_game/2 with valid data updates the game" do
      game = game_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name"}

      assert {:ok, %Game{} = game} = Database.update_game(game, update_attrs)
      assert game.description == "some updated description"
      assert game.name == "some updated name"
    end

    test "update_game/2 with invalid data returns error changeset" do
      game = game_fixture()
      assert {:error, %Ecto.Changeset{}} = Database.update_game(game, @invalid_attrs)
      assert game == Database.get_game!(game.id)
    end

    test "delete_game/1 deletes the game" do
      game = game_fixture()
      assert {:ok, %Game{}} = Database.delete_game(game)
      assert_raise Ecto.NoResultsError, fn -> Database.get_game!(game.id) end
    end

    test "change_game/1 returns a game changeset" do
      game = game_fixture()
      assert %Ecto.Changeset{} = Database.change_game(game)
    end
  end
end

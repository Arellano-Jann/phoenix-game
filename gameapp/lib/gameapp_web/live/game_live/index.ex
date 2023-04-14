defmodule GameappWeb.GameLive.Index do
  use GameappWeb, :live_view
  alias Gameapp.Repo
  alias Gameapp.Database
  alias Gameapp.Database.Game

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket) do
      Database.subscribe()
    end
    {:ok, stream(socket, :games, Database.list_games())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Game")
    |> assign(:game, Database.get_game!(id))
    |> assign(:systems, Database.list_systems())
    |> assign(:brands, Database.list_brands())
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Game")
    |> assign(:game, %Game{})
    |> assign(:systems, Database.list_systems())
    |> assign(:brands, Database.list_brands())
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Games")
    |> assign(:game, nil)
  end

  @impl true
  def handle_info({GameappWeb.GameLive.FormComponent, {:saved, game}}, socket) do
    {:noreply, stream_insert(socket, :games, game |> Repo.preload(:system, force: true) |> Repo.preload(:brand, force: true))}
  end

  @impl true
  def handle_info({:game_created, game}, socket) do
    {:noreply, stream_insert(socket, :games, game)}
  end

  def handle_info({:game_updated, game}, socket) do
    {:noreply, stream_insert(socket, :games, game)}
  end

  def handle_info({:game_deleted, game}, socket) do
    {:noreply, stream_delete(socket, :games, game)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    game = Database.get_game!(id)
    {:ok, _} = Database.delete_game(game)

    {:noreply, stream_delete(socket, :games, game)}
  end
end

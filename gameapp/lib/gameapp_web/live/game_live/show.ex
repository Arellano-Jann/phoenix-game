defmodule GameappWeb.GameLive.Show do
  use GameappWeb, :live_view

  alias Gameapp.Database

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:game, Database.get_game!(id))
     |> assign(:systems, Database.list_systems())
     |> assign(:brands, Database.list_brands())
    #  |> assign(:system, Database.get_system!(Database.get_game!(id).system_id))
    #  |> assign(:brand, Database.get_brand!(Database.get_game!(id).brand))
    }
  end

  defp page_title(:show), do: "Show Game"
  defp page_title(:edit), do: "Edit Game"
end

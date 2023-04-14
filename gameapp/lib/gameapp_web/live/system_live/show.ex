defmodule GameappWeb.SystemLive.Show do
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
     |> assign(:system, Database.get_system!(id))}
  end

  defp page_title(:show), do: "Show System"
  defp page_title(:edit), do: "Edit System"
end

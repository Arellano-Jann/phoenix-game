defmodule GameappWeb.SystemLive.Index do
  use GameappWeb, :live_view

  alias Gameapp.Database

  alias Gameapp.Database.System


  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :systems, Database.list_systems())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit System")
    |> assign(:system, Database.get_system!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New System")
    |> assign(:system, %System{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Systems")
    |> assign(:system, nil)
  end

  @impl true
  def handle_info({GameappWeb.SystemLive.FormComponent, {:saved, system}}, socket) do
    {:noreply, stream_insert(socket, :systems, system)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    system = Database.get_system!(id)
    {:ok, _} = Database.delete_system(system)

    {:noreply, stream_delete(socket, :systems, system)}
  end
end

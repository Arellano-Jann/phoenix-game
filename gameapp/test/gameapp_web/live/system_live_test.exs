defmodule GameappWeb.SystemLiveTest do
  use GameappWeb.ConnCase

  import Phoenix.LiveViewTest
  import Gameapp.DatabaseFixtures

  @create_attrs %{maker: "some maker", name: "some name"}
  @update_attrs %{maker: "some updated maker", name: "some updated name"}
  @invalid_attrs %{maker: nil, name: nil}

  defp create_system(_) do
    system = system_fixture()
    %{system: system}
  end

  describe "Index" do
    setup [:create_system]

    test "lists all systems", %{conn: conn, system: system} do
      {:ok, _index_live, html} = live(conn, ~p"/systems")

      assert html =~ "Listing Systems"
      assert html =~ system.maker
    end

    test "saves new system", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/systems")

      assert index_live |> element("a", "New System") |> render_click() =~
               "New System"

      assert_patch(index_live, ~p"/systems/new")

      assert index_live
             |> form("#system-form", system: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#system-form", system: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/systems")

      html = render(index_live)
      assert html =~ "System created successfully"
      assert html =~ "some maker"
    end

    test "updates system in listing", %{conn: conn, system: system} do
      {:ok, index_live, _html} = live(conn, ~p"/systems")

      assert index_live |> element("#systems-#{system.id} a", "Edit") |> render_click() =~
               "Edit System"

      assert_patch(index_live, ~p"/systems/#{system}/edit")

      assert index_live
             |> form("#system-form", system: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#system-form", system: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/systems")

      html = render(index_live)
      assert html =~ "System updated successfully"
      assert html =~ "some updated maker"
    end

    test "deletes system in listing", %{conn: conn, system: system} do
      {:ok, index_live, _html} = live(conn, ~p"/systems")

      assert index_live |> element("#systems-#{system.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#systems-#{system.id}")
    end
  end

  describe "Show" do
    setup [:create_system]

    test "displays system", %{conn: conn, system: system} do
      {:ok, _show_live, html} = live(conn, ~p"/systems/#{system}")

      assert html =~ "Show System"
      assert html =~ system.maker
    end

    test "updates system within modal", %{conn: conn, system: system} do
      {:ok, show_live, _html} = live(conn, ~p"/systems/#{system}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit System"

      assert_patch(show_live, ~p"/systems/#{system}/show/edit")

      assert show_live
             |> form("#system-form", system: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#system-form", system: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/systems/#{system}")

      html = render(show_live)
      assert html =~ "System updated successfully"
      assert html =~ "some updated maker"
    end
  end
end

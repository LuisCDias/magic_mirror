defmodule MagicMirrorWeb.TextBoxControllerTest do
  use MagicMirrorWeb.ConnCase

  alias MagicMirror.Widgets

  @create_attrs %{content: "some content", name: "some name", x_pos: 42, y_pos: 42}
  @update_attrs %{content: "some updated content", name: "some updated name", x_pos: 43, y_pos: 43}
  @invalid_attrs %{content: nil, name: nil, x_pos: nil, y_pos: nil}

  def fixture(:text_box) do
    {:ok, text_box} = Widgets.create_text_box(@create_attrs)
    text_box
  end

  describe "index" do
    test "lists all text_boxes", %{conn: conn} do
      conn = get(conn, Routes.text_box_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Text boxes"
    end
  end

  describe "new text_box" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.text_box_path(conn, :new))
      assert html_response(conn, 200) =~ "New Text box"
    end
  end

  describe "create text_box" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.text_box_path(conn, :create), text_box: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.text_box_path(conn, :show, id)

      conn = get(conn, Routes.text_box_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Text box"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.text_box_path(conn, :create), text_box: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Text box"
    end
  end

  describe "edit text_box" do
    setup [:create_text_box]

    test "renders form for editing chosen text_box", %{conn: conn, text_box: text_box} do
      conn = get(conn, Routes.text_box_path(conn, :edit, text_box))
      assert html_response(conn, 200) =~ "Edit Text box"
    end
  end

  describe "update text_box" do
    setup [:create_text_box]

    test "redirects when data is valid", %{conn: conn, text_box: text_box} do
      conn = put(conn, Routes.text_box_path(conn, :update, text_box), text_box: @update_attrs)
      assert redirected_to(conn) == Routes.text_box_path(conn, :show, text_box)

      conn = get(conn, Routes.text_box_path(conn, :show, text_box))
      assert html_response(conn, 200) =~ "some updated content"
    end

    test "renders errors when data is invalid", %{conn: conn, text_box: text_box} do
      conn = put(conn, Routes.text_box_path(conn, :update, text_box), text_box: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Text box"
    end
  end

  describe "delete text_box" do
    setup [:create_text_box]

    test "deletes chosen text_box", %{conn: conn, text_box: text_box} do
      conn = delete(conn, Routes.text_box_path(conn, :delete, text_box))
      assert redirected_to(conn) == Routes.text_box_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.text_box_path(conn, :show, text_box))
      end
    end
  end

  defp create_text_box(_) do
    text_box = fixture(:text_box)
    {:ok, text_box: text_box}
  end
end

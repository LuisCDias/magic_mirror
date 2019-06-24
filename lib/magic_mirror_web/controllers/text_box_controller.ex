defmodule MagicMirrorWeb.TextBoxController do
  use MagicMirrorWeb, :controller

  alias MagicMirror.Widgets
  alias MagicMirror.Widgets.TextBox

  def index(conn, _params) do
    text_boxes = Widgets.list_text_boxes()
    render(conn, "index.html", text_boxes: text_boxes)
  end

  def new(conn, _params) do
    changeset = Widgets.change_text_box(%TextBox{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"text_box" => text_box_params}) do
    case Widgets.create_text_box(text_box_params) do
      {:ok, text_box} ->
        conn
        |> put_flash(:info, "Text box created successfully.")
        |> redirect(to: Routes.text_box_path(conn, :show, text_box))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    text_box = Widgets.get_text_box!(id)
    render(conn, "show.html", text_box: text_box)
  end

  def edit(conn, %{"id" => id}) do
    text_box = Widgets.get_text_box!(id)
    changeset = Widgets.change_text_box(text_box)
    render(conn, "edit.html", text_box: text_box, changeset: changeset)
  end

  def update(conn, %{"id" => id, "text_box" => text_box_params}) do
    text_box = Widgets.get_text_box!(id)

    case Widgets.update_text_box(text_box, text_box_params) do
      {:ok, text_box} ->
        conn
        |> put_flash(:info, "Text box updated successfully.")
        |> redirect(to: Routes.text_box_path(conn, :show, text_box))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", text_box: text_box, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    text_box = Widgets.get_text_box!(id)
    {:ok, _text_box} = Widgets.delete_text_box(text_box)

    conn
    |> put_flash(:info, "Text box deleted successfully.")
    |> redirect(to: Routes.text_box_path(conn, :index))
  end
end

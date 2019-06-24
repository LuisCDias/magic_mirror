defmodule MagicMirror.WidgetsTest do
  use MagicMirror.DataCase

  alias MagicMirror.Widgets

  describe "text_boxes" do
    alias MagicMirror.Widgets.TextBox

    @valid_attrs %{content: "some content", name: "some name", x_pos: 42, y_pos: 42}
    @update_attrs %{content: "some updated content", name: "some updated name", x_pos: 43, y_pos: 43}
    @invalid_attrs %{content: nil, name: nil, x_pos: nil, y_pos: nil}

    def text_box_fixture(attrs \\ %{}) do
      {:ok, text_box} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Widgets.create_text_box()

      text_box
    end

    test "list_text_boxes/0 returns all text_boxes" do
      text_box = text_box_fixture()
      assert Widgets.list_text_boxes() == [text_box]
    end

    test "get_text_box!/1 returns the text_box with given id" do
      text_box = text_box_fixture()
      assert Widgets.get_text_box!(text_box.id) == text_box
    end

    test "create_text_box/1 with valid data creates a text_box" do
      assert {:ok, %TextBox{} = text_box} = Widgets.create_text_box(@valid_attrs)
      assert text_box.content == "some content"
      assert text_box.name == "some name"
      assert text_box.x_pos == 42
      assert text_box.y_pos == 42
    end

    test "create_text_box/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Widgets.create_text_box(@invalid_attrs)
    end

    test "update_text_box/2 with valid data updates the text_box" do
      text_box = text_box_fixture()
      assert {:ok, %TextBox{} = text_box} = Widgets.update_text_box(text_box, @update_attrs)
      assert text_box.content == "some updated content"
      assert text_box.name == "some updated name"
      assert text_box.x_pos == 43
      assert text_box.y_pos == 43
    end

    test "update_text_box/2 with invalid data returns error changeset" do
      text_box = text_box_fixture()
      assert {:error, %Ecto.Changeset{}} = Widgets.update_text_box(text_box, @invalid_attrs)
      assert text_box == Widgets.get_text_box!(text_box.id)
    end

    test "delete_text_box/1 deletes the text_box" do
      text_box = text_box_fixture()
      assert {:ok, %TextBox{}} = Widgets.delete_text_box(text_box)
      assert_raise Ecto.NoResultsError, fn -> Widgets.get_text_box!(text_box.id) end
    end

    test "change_text_box/1 returns a text_box changeset" do
      text_box = text_box_fixture()
      assert %Ecto.Changeset{} = Widgets.change_text_box(text_box)
    end
  end
end

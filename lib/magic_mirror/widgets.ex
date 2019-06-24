defmodule MagicMirror.Widgets do
  @moduledoc """
  The Widgets context.
  """

  import Ecto.Query, warn: false
  alias MagicMirror.Repo

  alias MagicMirror.Widgets.TextBox

  @doc """
  Returns the list of text_boxes.

  ## Examples

      iex> list_text_boxes()
      [%TextBox{}, ...]

  """
  def list_text_boxes do
    Repo.all(TextBox)
  end

  @doc """
  Gets a single text_box.

  Raises `Ecto.NoResultsError` if the Text box does not exist.

  ## Examples

      iex> get_text_box!(123)
      %TextBox{}

      iex> get_text_box!(456)
      ** (Ecto.NoResultsError)

  """
  def get_text_box!(id), do: Repo.get!(TextBox, id)

  @doc """
  Creates a text_box.

  ## Examples

      iex> create_text_box(%{field: value})
      {:ok, %TextBox{}}

      iex> create_text_box(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_text_box(attrs \\ %{}) do
    %TextBox{}
    |> TextBox.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a text_box.

  ## Examples

      iex> update_text_box(text_box, %{field: new_value})
      {:ok, %TextBox{}}

      iex> update_text_box(text_box, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_text_box(%TextBox{} = text_box, attrs) do
    text_box
    |> TextBox.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a TextBox.

  ## Examples

      iex> delete_text_box(text_box)
      {:ok, %TextBox{}}

      iex> delete_text_box(text_box)
      {:error, %Ecto.Changeset{}}

  """
  def delete_text_box(%TextBox{} = text_box) do
    Repo.delete(text_box)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking text_box changes.

  ## Examples

      iex> change_text_box(text_box)
      %Ecto.Changeset{source: %TextBox{}}

  """
  def change_text_box(%TextBox{} = text_box) do
    TextBox.changeset(text_box, %{})
  end
end

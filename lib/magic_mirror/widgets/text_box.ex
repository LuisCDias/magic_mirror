defmodule MagicMirror.Widgets.TextBox do
  use Ecto.Schema
  import Ecto.Changeset

  schema "text_boxes" do
    field :content, :string
    field :name, :string
    field :x_pos, :integer
    field :y_pos, :integer

    timestamps()
  end

  @doc false
  def changeset(text_box, attrs) do
    text_box
    |> cast(attrs, [:name, :content, :x_pos, :y_pos])
    |> validate_required([:name, :content, :x_pos, :y_pos])
  end
end

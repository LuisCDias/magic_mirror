defmodule MagicMirror.Repo.Migrations.CreateTextBoxes do
  use Ecto.Migration

  def change do
    create table(:text_boxes) do
      add :name, :string
      add :content, :text
      add :x_pos, :integer
      add :y_pos, :integer

      timestamps()
    end

  end
end

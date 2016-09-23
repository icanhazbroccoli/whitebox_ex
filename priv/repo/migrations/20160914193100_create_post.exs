defmodule Whitebox.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title,     :string, null: false, size: 255
      add :slug,      :string, null: false, size: 128
      add :body,      :text
      add :published, :boolean, default: false, null: false

      timestamps
    end

  end
end

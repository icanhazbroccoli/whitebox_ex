defmodule Whitebox.Repo.Migrations.AddPostsSlugIndex do
  use Ecto.Migration

  def change do
    create index(:posts, [:slug], unique: true)
  end
end

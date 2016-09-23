defmodule Whitebox.Post do
  use Whitebox.Web, :model
  import Ecto.Query, only: [from: 2]
  alias Ecto.Changeset

  schema "posts" do
    field :title    , :string
    field :slug     , :string
    field :body     , :string
    field :published, :boolean

    timestamps
  end

  @required_fields ~w(title body published)
  @optional_fields ~w(slug)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
      |> cast(params, @required_fields, @optional_fields)
      |> gen_slug
      |> validate_required(:slug)
      |> unique_constraint(:slug)
  end

  def all_published do
    from p in __MODULE__,
      where: p.published == false
  end

  def cut(body) do
    body
      |> String.split(~r{<cut/?>})
      |> Enum.at(0)
  end

  def by_slug(slug) do
    Whitebox.Repo.get_by(__MODULE__, slug: slug)
  end

  # private methods

  defp gen_slug(changeset = %Changeset{changes: %{slug: _slug}}) do
    changeset
  end

  defp gen_slug(changeset = %Changeset{changes: %{title: title}}) do
    slug = title
            |> String.replace(~r([^\w\d]), "_", global: true)
            |> String.replace(~r(_{2,}), "_", global: true)
            |> String.replace(~r(^_+$), "")
            |> String.downcase
    changeset |> change(slug: slug)
  end

  defp gen_slug(changeset), do: changeset

end

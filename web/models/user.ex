defmodule Whitebox.User do
  use Whitebox.Web, :model

  schema "users" do
    field :name, :string
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
      |> cast(params, [:name, :username])
      |> validate_required([:name, :username])
      |> validate_length(:username, min: 3, max: 20)
  end

  def registration_changeset(struct, params) do
    struct
      |> changeset(params)
      |> cast(params, [:password])
      |> validate_length(:password, min: 6, max: 100)
      |> put_pass_hash()
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ -> changeset
    end
  end


end

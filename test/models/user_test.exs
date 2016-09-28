defmodule Whitebox.UserTest do
  use Whitebox.ModelCase

  alias Whitebox.User

  @valid_attrs %{name: "some content", password: "some content", username: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "hashes the password" do
    changeset= User.registration_changeset(%User{}, @valid_attrs)
    assert changeset.valid?
    %Ecto.Changeset{changes: %{password_hash: password_hash}}= changeset
    assert password_hash != nil
  end

end

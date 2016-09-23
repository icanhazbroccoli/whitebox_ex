defmodule Whitebox.PostTest do
  use Whitebox.ModelCase
  import Ecto.Changeset, only: [get_change: 2]

  alias Whitebox.Post
  alias Whitebox.Repo

  @valid_attrs %{body: "some content", slug: "some_content", published: true, title: "some content"}
  @valid_attrs_no_slug Map.delete(@valid_attrs, :slug)
  @invalid_attrs %{}

  @tag :test_model
  test "changeset with valid attributes" do
    changeset = Post.changeset(%Post{}, @valid_attrs)
    assert changeset.valid?
  end

  @tag :test_model
  test "changeset with invalid attributes" do
    changeset = Post.changeset(%Post{}, @invalid_attrs)
    refute changeset.valid?
  end

  @tag :test_model
  test "changeset without slug is valid" do
    changeset = Post.changeset(%Post{}, @valid_attrs_no_slug)
    assert changeset.valid?
  end

  @tag :test_model
  test "autogenerates slug" do
    changeset = Post.changeset(%Post{}, @valid_attrs_no_slug)
    assert get_change(changeset, :slug) == "some_content"
  end

  @tag :test_model
  test "existing slug remains untouched" do
    changeset = Post.changeset(%Post{}, Map.put(@valid_attrs, :slug, "some_test_slug"))
    assert get_change(changeset, :slug) == "some_test_slug"
  end

  @tag :test_model
  test "slug words are joined by single underscore" do
    changeset = Post.changeset(%Post{}, Map.put(@valid_attrs_no_slug, :title, "hello    world"))
    assert get_change(changeset, :slug) == "hello_world"
  end

  @tag :test_model
  test "slug is downcased" do
    changeset = Post.changeset(%Post{}, Map.put(@valid_attrs_no_slug, :title, "Hello World"))
    assert get_change(changeset, :slug) == "hello_world"
  end

  @tag :test_model
  test "empty string slug is handled as nil" do
    changeset = Post.changeset(%Post{}, Map.put(@valid_attrs_no_slug, :slug, ""))
    assert changeset.valid?
  end

  @tag :test_model
  test "cut the body down to the <cut/> tag" do
    body = """
line 1
line 2
line 3
<cut/>
line 4
line 5
"""
    assert Post.cut(body) == """
line 1
line 2
line 3
"""
  end

  @tag :test_model
  test "takes the entire body if there is no <cut> tag" do
    body = """
line 1
line 2
line 3
"""
    assert Post.cut(body) == """
line 1
line 2
line 3
"""
  end

  @tag :test_model
  test "Fetches the post by it's slug" do
    changeset= Post.changeset(%Post{}, Map.put(@valid_attrs, :slug, "test_slug"))
    {:ok, _post}= Repo.insert(changeset)
    post= Post.by_slug("test_slug")
    assert post != nil
    assert post.slug == "test_slug"
  end


end

defmodule Whitebox.PageController do
  use Whitebox.Web, :controller
  import Ecto.Query, only: [order_by: 2]
  require Logger
  alias Whitebox.Repo
  alias Whitebox.Post

  def index(conn, params) do
    posts= Post.all_published
            |> order_by(desc: :inserted_at)
            |> Repo.paginate(params)
    render conn, "index.html",
      posts: posts
  end

  def post(conn, params) do
    # post= Post.
  end

end

defmodule Whitebox.Router do
  use Whitebox.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :editor do
    plug :put_layout, {Whitebox.LayoutView, :editor}
  end

  scope "/", Whitebox do
    pipe_through :browser # Use the default browser stack
    get "/", PageController, :index
    get "/p/:slug", PageController, :post
  end

  scope "/edit", Whitebox do
    pipe_through [:browser, :editor]
    resources "/posts", PostController
    resources "/users", UserController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Whitebox do
  #   pipe_through :api
  # end
end

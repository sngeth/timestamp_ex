defmodule TimestampEx.Router do
  use TimestampEx.Web, :router

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

  scope "/", TimestampEx do
    pipe_through :api # Use the default browser stack

    get "/:date", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", TimestampEx do
  #   pipe_through :api
  # end
end

defmodule HieApp.Router do
  use HieApp.Web, :router

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

  scope "/", HieApp do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    # our app
    get "/form", FormController, :index

  end

  # Other scopes may use custom stacks.
  scope "/api", HieApp do
    pipe_through :api

    resources "/formmodels", FormModelController, except: [:new, :edit]
  end
end

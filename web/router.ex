defmodule Raagtime.Router do
  use Raagtime.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Raagtime do
    pipe_through :browser # Use the default browser stack

    get "/", RagaController, :index

    resources "/ragas", RagaController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Raagtime do
  #   pipe_through :api
  # end
end

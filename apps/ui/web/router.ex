defmodule Ui.Router do
  use Ui.Web, :router

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

  scope "/", Ui do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", Ui do
    pipe_through :api

    resources "/payments", PaymentsController, only: [:index, :show, :create]
  end
end

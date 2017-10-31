defmodule GraphqlProject.Router do
  use GraphqlProject.Web, :router

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

  scope "/", GraphqlProject do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  forward "/api", Absinthe.Plug,
    schema: GraphqlProject.Schema

  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: GraphqlProject.Schema

  scope "/admin", GraphqlProject.Admin, as: :admin do
    pipe_through :browser

    resources "/posts", PostController
    resources "/users", UserController
  end

  # Other scopes may use custom stacks.
  # scope "/api", GraphqlProject do
  #   pipe_through :api
  # end
end

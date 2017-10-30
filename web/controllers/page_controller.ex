defmodule GraphqlProject.PageController do
  use GraphqlProject.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

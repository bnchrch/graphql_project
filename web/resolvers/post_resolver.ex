defmodule GraphqlProject.PostResolver do
  alias GraphqlProject.Repo
  alias GraphqlProject.Post
 
  def all(_args, _info) do
    {:ok, Repo.all(Post)}
  end
end
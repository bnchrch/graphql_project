alias GraphqlProject.User
alias GraphqlProject.Post
alias GraphqlProject.Repo
alias GraphqlProject.Factory

defmodule Seed do
  def build_posts_for_user(user, num_posts_per_user), do: Factory.build_list(num_posts_per_user, :post, user: user)
  
  def build_users(quantity), do: Factory.build_list(quantity, :user)
  
  def seed_database(num_users, num_posts_per_user) do
    num_users
    |> build_users
    |> Enum.flat_map(fn user -> build_posts_for_user(user, num_posts_per_user) end)
    |> Enum.map(&Repo.insert!/1)
  end
end


Seed.seed_database(10, 5)


defmodule GraphqlProject.Factory do
  @moduledoc "Model factories"
  alias GraphqlProject.{User, Post}

  use ExMachina.Ecto, repo: GraphqlProject.Repo

  def user_factory do
    %User{
      email: Faker.Internet.email(),
      name: Faker.Name.name()
    }
  end

  def post_factory do
    %Post{
      title: Faker.Lorem.sentence,
      body: Faker.Lorem.paragraph,
      user: build(:user)
    }
  end

end

defmodule GraphqlProject.Schema do
  use Absinthe.Schema
  import_types GraphqlProject.Schema.Types
 
  query do
    field :posts, list_of(:post) do
      resolve &GraphqlProject.PostResolver.all/2
    end
 
    field :users, list_of(:user) do
      resolve &GraphqlProject.UserResolver.all/2
    end

    field :user, type: :user do
      arg :id, non_null(:id)
      resolve &GraphqlProject.UserResolver.find/2
    end
  end
end
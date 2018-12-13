# frozen_string_literal: true

Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :createUser, function: Resolvers::CreateUser.new
  field :signInUser, function: Resolvers::SignInUser.new
  field :createCategory, function: Resolvers::CreateCategory.new
  field :createBusiness, function: Resolvers::CreateBusiness.new
  field :createReview, function: Resolvers::CreateReview.new
end

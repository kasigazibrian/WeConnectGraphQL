# frozen_string_literal: true

Types::UserType = GraphQL::ObjectType.define do
  name 'User'

  field :username, !types.String
  field :id, !types.ID
  field :email, types.String
  field :gender, types.String
  field :last_name, types.String
  field :first_name, types.String
end

# frozen_string_literal: true

Types::SignInPayload = GraphQL::ObjectType.define do
  name 'SignInPayload'

  field :user, Types::UserType
  field :token, types.String
end

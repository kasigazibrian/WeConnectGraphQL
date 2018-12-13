# frozen_string_literal: true

Types::AuthenticationCredentials = GraphQL::InputObjectType.define do
  name 'AUTHENTICATION_CREDENTIALS'

  argument :username, !types.String
  argument :password, !types.String
end

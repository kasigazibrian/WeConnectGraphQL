# frozen_string_literal: true

class Resolvers::CreateUser < GraphQL::Function
  argument :email, !types.String
  argument :first_name, types.String
  argument :last_name, types.String
  argument :gender, types.String
  argument :auth_credentials, !Types::AuthenticationCredentials

  type Types::UserType

  def call(_obj, args, _ctx)
    User.create!(
      email: args[:email], username: args[:auth_credentials][:username],
      first_name: args[:first_name], last_name: args[:last_name],
      password: args[:auth_credentials][:password], gender: args[:gender]
    )
  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new(
      "Invalid input: #{e.record.errors.full_messages.join(', ')}"
    )
  end
end

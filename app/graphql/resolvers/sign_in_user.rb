# frozen_string_literal: true

class Resolvers::SignInUser < GraphQL::Function
  argument :auth_credentials, Types::AuthenticationCredentials

  type !Types::SignInPayload

  def call(_obj, args, ctx)
    return unless args[:auth_credentials]

    user = User.find_by(username: args[:auth_credentials][:username])

    return if user.nil?

    return unless user.authenticate(args[:auth_credentials][:password])

    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
    token = crypt.encrypt_and_sign("user-id:#{user.id}")
    ctx[:session][:token] = token

    OpenStruct.new(
      user: user,
      token: token
    )
  end

  # def user_missing
  #   OpenStruct.new(
  #     user: { id: 'User not found' }
  #   )
  # end
end

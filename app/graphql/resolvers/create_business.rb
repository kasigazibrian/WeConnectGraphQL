# frozen_string_literal: true

class Resolvers::CreateBusiness < GraphQL::Function
  argument :email, types.String
  argument :contact_number, types.String
  argument :description, types.String
  argument :location, !types.String
  argument :category_id, !types.ID
  argument :name, !types.String

  type Types::BusinessType

  def call(_obj, args, ctx)
    # binding.pry
    Business.create!(
      email: args[:email], contact_number: args[:contact_number],
      description: args[:description], location: args[:location],
      category_id: args[:category_id], user: ctx[:current_user],
      name: args[:name]
    )
  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new(
      "Errors: #{e.record.errors.full_messages.join(', ')}"
    )
  end
end

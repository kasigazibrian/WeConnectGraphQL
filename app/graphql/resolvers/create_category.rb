# frozen_string_literal: true

class Resolvers::CreateCategory < GraphQL::Function
  argument :name, !types.String

  type Types::CategoryType

  def call(_obj, args, _ctx)
    Category.create!(
      name: args[:name]
    )
  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new(
      "Invalid input: #{e.record.errors.full_messages.join(', ')}"
    )
  end
end

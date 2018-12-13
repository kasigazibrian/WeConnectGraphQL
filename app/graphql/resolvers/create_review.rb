# frozen_string_literal: true

class Resolvers::CreateReview < GraphQL::Function
  argument :title, !types.String
  argument :body, types.String
  argument :businessID, types.Int

  type Types::ReviewType

  def call(_obj, args, _ctx)
    Review.create!(title: args[:title],
                   body: args[:body],
                   user: ctx[:currentUser], business_id: args[:businessID])
  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new(
      "Errors: #{e.record.errors.full_messages.join(', ')}"
    )
  end
end

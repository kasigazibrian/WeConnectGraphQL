# frozen_string_literal: true

Types::ReviewType = GraphQL::ObjectType.define do
  name 'Review'

  field :id, !types.ID
  field :title, !types.String
  field :body, types.String
  field :posted_by, -> { Types::UserType }, property: :user
end

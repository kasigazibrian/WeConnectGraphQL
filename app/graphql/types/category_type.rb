# frozen_string_literal: true

Types::CategoryType = GraphQL::ObjectType.define do
  name 'Category'

  field :name, types.String
  field :id, !types.ID
end

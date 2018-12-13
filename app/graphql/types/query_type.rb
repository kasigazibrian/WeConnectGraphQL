# frozen_string_literal: true

Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :allCategories, !types[Types::CategoryType] do
    description 'All business categories available'
    resolve ->(_obj, _args, _ctx) { Category.all }
  end

  field :allBusinesses, !types[Types::BusinessType] do
    description 'All businesses registered'
    resolve ->(_obj, _args, _ctx) { Business.all }
  end
end

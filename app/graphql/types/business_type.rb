# frozen_string_literal: true

Types::BusinessType = GraphQL::ObjectType.define do
  name 'Business'

  field :id, !types.ID
  field :email, types.String
  field :contact_number, types.String
  field :description, types.String
  field :location, !types.String
  field :category, -> { !Types::CategoryType }
  field :created_by, -> { Types::UserType }, property: :user
  field :reviews, -> { types[Types::ReviewType] }
end

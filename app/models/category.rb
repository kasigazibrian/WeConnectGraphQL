# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :businesses

  validates :name, presence: { message: 'is a required field' }, length:
      { minimum: 5 }, uniqueness: { message: 'has already been taken' }
end

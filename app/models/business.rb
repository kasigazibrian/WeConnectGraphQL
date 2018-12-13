# frozen_string_literal: true

class Business < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :reviews

  validates :name, presence: { message: 'is a required field' },
                   uniqueness: { message: 'has already been taken' }
  validates :email, presence: { message: 'is a required field' },
                    format: { with: /\A[^@\s]+@[^@\s]+\z/ },
                    uniqueness: { message: 'has already been taken' }
  validates :contact_number, uniqueness: { message: 'already exists' }
  validates_format_of :contact_number,
                      with: /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/
end

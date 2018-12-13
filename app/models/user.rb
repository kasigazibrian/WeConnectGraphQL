# frozen_string_literal: true

class User < ApplicationRecord
  has_many :businesses
  has_many :reviews
  # has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_secure_password

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :gender, inclusion: %w[male female Male Female]
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
end

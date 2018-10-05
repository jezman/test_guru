class User < ApplicationRecord
  has_many :test_passings
  has_many :tests, through: :test_passings
end

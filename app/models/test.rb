class Test < ApplicationRecord
  belongs_to :category
  has_many :test_passings
  has_many :users, through: :test_passings
end

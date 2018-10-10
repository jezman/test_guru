class User < ApplicationRecord
  has_many :test_passings
  has_many :tests, through: :test_passings
  has_many :tests_author, class_name: 'Test', foreign_key: :author_id

  validates :email, presence: true

  def tests_by_level(level)
    tests.by_level(level)
  end
end

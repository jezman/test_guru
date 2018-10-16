class User < ApplicationRecord
  has_many :test_passings
  has_many :tests, through: :test_passings
  has_many :tests_author, class_name: 'Test', foreign_key: :author_id

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_secure_password

  def tests_by_level(level)
    tests.by_level(level)
  end

  def test_passing(test)
    test_passings.order(id: :desc).find_by(test_id: test.id)
  end
end

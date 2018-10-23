class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :trackable

  has_many :test_passings
  has_many :tests, through: :test_passings
  has_many :tests_author, class_name: 'Test', foreign_key: :author_id
  has_many :gists

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def tests_by_level(level)
    tests.by_level(level)
  end

  def test_passing(test)
    test_passings.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end
end

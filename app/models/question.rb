class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, presence: true

  def short_body
    body[0..24]
  end
end

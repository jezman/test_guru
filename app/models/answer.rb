class Answer < ApplicationRecord
  MAX_ANSWERS_COUNT = 4

  belongs_to :question

  validates :body, presence: true
  validate :answers_count, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def answers_count
    message = 'exceeded maximum number of answers to the question'
    errors.add(:question, message) if question.answers.count >= MAX_ANSWERS_COUNT
  end
end

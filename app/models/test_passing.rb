class TestPassing < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  def accept!(answer_ids)
    self.correct_answers += 1 if correct_answer?(answer_ids)

    self.current_question = next_question
    save!
  end

  def completed?
    current_question.nil?
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers_count = true_answers.count

    (correct_answers_count == true_answers.where(id: answer_ids).count) &&
      correct_answers_count == answer_ids.count
  end

  def true_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end

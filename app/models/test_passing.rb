class TestPassing < ApplicationRecord
  SUCCESS_PERSENT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question, on: %i[create update]

  def accept!(answer_ids)
    self.correct_answers += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def current_question_number
    test.questions.index(current_question) + 1
  end

  def correct_answers_percent
    (correct_answers.to_f / test.questions.count.to_f) * 100
  end

  def successfully_completed?
    correct_answers_percent >= SUCCESS_PERSENT
  end

  def time_limit_test?
    test.time_limit.present?
  end

  def remaining_seconds
    ((created_at + test.time_limit.minutes) - Time.current).to_i
  end

  def time_out?
    remaining_seconds <= 0 if time_limit_test?
  end

  private

  def before_validation_set_current_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers_count = true_answers.count

    (correct_answers_count == answer_ids.count) &&
      correct_answers_count == true_answers.where(id: answer_ids).count
  end

  def true_answers
    @true_answers ||= current_question.answers.correct
  end

  def next_question
    test.questions
        .order(:id)
        .where('id > ?', current_question.nil? ? 0 : current_question.id).first
  end
end

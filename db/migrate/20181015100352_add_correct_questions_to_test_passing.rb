class AddCorrectQuestionsToTestPassing < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passings, :current_question_id, :integer, index: true
    add_column :test_passings, :correct_answers, :integer, default: 0
  end
end

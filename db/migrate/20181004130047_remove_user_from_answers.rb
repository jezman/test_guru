class RemoveUserFromAnswers < ActiveRecord::Migration[5.2]
  def change
    remove_reference :answers, :user, foreign_key: true
  end
end

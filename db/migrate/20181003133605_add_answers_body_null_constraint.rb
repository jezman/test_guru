class AddAnswersBodyNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null :answers, :body, false
  end
end

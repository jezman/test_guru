class AddTestsTitleNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null :tests, :title, false
  end
end

class AddCategoriesTitleNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null :categories, :title, false
  end
end

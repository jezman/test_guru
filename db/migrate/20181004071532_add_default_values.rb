class AddDefaultValues < ActiveRecord::Migration[5.2]
  def change
    change_column_default :tests, :level, from: nil, to: 1
    change_column_default :answers, :correct, from: nil, to: false
  end
end

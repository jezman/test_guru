class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.references :user, foreign_key: true
      t.string :title, null: false
      t.text :path, null: false

      t.timestamps
    end
  end
end

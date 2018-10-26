class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.text :assigment_rule, null: false
      t.text :image_path
      t.integer :level
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end

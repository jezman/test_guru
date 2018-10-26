class CreateUsersBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :users_badges do |t|
      t.references :user, foreign_key: true, index: false
      t.references :badge, foreign_key: true, index: false

      t.timestamps
    end

    add_index :users_badges, %i[user_id badge_id]
  end
end

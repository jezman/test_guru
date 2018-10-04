class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :body
      t.references :question, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :correct

      t.timestamps
    end
  end
end

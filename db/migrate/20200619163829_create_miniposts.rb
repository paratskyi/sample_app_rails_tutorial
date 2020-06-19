class CreateMiniposts < ActiveRecord::Migration[6.0]
  def change
    create_table :miniposts do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :miniposts, %i[user_id created_at]
  end
end

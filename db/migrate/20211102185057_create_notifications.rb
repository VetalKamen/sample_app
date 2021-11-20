class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.string :text
      t.integer :target_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :notifications, :target_id
    add_index :notifications, %i[user_id target_id], unique: true
  end
end

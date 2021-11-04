class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.string :text
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :notifications, [:user_id, :created_at]
  end
end

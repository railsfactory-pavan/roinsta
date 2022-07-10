class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.belongs_to :user, foreign_key: true
      t.integer :recipient_id, null: false, index: { unique: true }

      t.timestamps
    end
  end
end

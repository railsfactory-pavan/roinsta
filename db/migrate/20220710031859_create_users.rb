class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :full_name
      t.string :user_name
      t.string :about
      t.string :avatar
      t.integer :followers_count, null: false, default: 0
      t.integer :following_count, null: false, default: 0

      t.timestamps
    end
  end
end

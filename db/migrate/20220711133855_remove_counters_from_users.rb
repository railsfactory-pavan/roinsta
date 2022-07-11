class RemoveCountersFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :followers_count, :integer
    remove_column :users, :following_count, :integer
  end
end

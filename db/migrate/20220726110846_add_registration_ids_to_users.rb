class AddRegistrationIdsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :registration_ids, :string
  end
end

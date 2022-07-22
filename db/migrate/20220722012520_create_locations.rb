class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :company_name
      t.string :address
      t.string :city
      t.string :postcode
      t.float :latitude
      t.float :longitude
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

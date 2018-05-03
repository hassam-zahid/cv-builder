class CreateUserLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :user_locations do |t|
      t.string :ip_address
      t.references :city, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

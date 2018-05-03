class CreateCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :country_code
      t.string :cell_code
      t.string :logs, default: ""
      t.string :time_zone
      t.integer :language_id
      t.boolean :is_active, default: true
      t.string :global_key
      
      t.timestamps
    end
  end
end

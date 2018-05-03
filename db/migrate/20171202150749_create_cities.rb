class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :name
      t.references :country, foreign_key: true
      t.boolean :is_active, default: true
      t.string :logs, default: ""
      t.string :global_key
      
      t.timestamps
    end
  end
end

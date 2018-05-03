class CreateMasterLookups < ActiveRecord::Migration[5.1]
  def change
    create_table :master_lookups do |t|
      t.string :key
      t.string :value
      t.string :category
      t.string :code
      t.string :logs, default: ""
      t.boolean :is_active, default: true
      t.string :global_key

      t.timestamps
    end
    add_index :master_lookups, :key
    add_index :master_lookups, :category
  end
end

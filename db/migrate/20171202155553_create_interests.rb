class CreateInterests < ActiveRecord::Migration[5.1]
  def change
    create_table :interests do |t|
      t.string :name
      t.boolean :is_active, default: true
      t.string :global_key
      
      t.timestamps
    end
  end
end

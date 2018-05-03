class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.boolean :is_active, default: true
      t.string :global_key
      
      t.timestamps
    end
  end
end

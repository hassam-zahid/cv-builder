class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string :name
      t.integer :access_level #1,2,3,4
      t.string :description
      t.string :logs, default: ""
      t.boolean :is_active, default: true
      t.string :global_key
      
      t.timestamps
    end
  end
end

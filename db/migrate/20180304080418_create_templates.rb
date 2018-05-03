class CreateTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :templates do |t|
      t.string :name
      t.string :global_key
      t.string :description
      t.references :category, foreign_key: true
      t.boolean :is_active 
      t.text :logs
      t.string :template_project_url 

      t.timestamps
    end
    add_index :templates, :global_key
  end
end

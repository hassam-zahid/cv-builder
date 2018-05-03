class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :description
      t.boolean :is_active, default: true
      t.string :global_key
      t.timestamps
    end
    add_index :companies, :name
  end
end

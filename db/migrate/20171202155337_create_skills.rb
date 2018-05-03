class CreateSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :skills do |t|
      t.string :name
      t.references :category, foreign_key: true
      t.boolean :is_active, default: true
      
      t.timestamps
    end
  end
end

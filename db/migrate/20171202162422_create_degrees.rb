class CreateDegrees < ActiveRecord::Migration[5.1]
  def change
    create_table :degrees do |t|
      t.string :name
      t.string :description
      t.boolean :is_active, default: true
      
      t.timestamps
    end
  end
end

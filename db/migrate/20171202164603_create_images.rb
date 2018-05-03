class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.references :user, foreign_key: true
      t.boolean :is_active, default: true
      t.string :logs, default: ""
      t.timestamps
    end
  end
end

class CreateAchievements < ActiveRecord::Migration[5.1]
  def change
    create_table :achievements do |t|
      t.string :title
      t.string :description
      t.date :achievement_date
      t.references :resume, foreign_key: true
      t.boolean :is_active, default: true
      t.string :global_key
      
      t.timestamps
    end
  end
end

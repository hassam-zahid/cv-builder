class CreateCategoriesInterests < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_interests do |t|
      t.references :category, foreign_key: true
      t.references :interest, foreign_key: true
      t.string :global_key
      
      t.timestamps
    end
  end
end

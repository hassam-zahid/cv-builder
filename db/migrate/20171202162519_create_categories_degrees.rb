class CreateCategoriesDegrees < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_degrees do |t|
      t.references :category, foreign_key: true
      t.references :degree, foreign_key: true

      t.timestamps
    end
  end
end

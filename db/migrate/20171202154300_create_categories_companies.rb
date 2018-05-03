class CreateCategoriesCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_companies do |t|
      t.references :category, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end

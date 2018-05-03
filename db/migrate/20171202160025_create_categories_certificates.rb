class CreateCategoriesCertificates < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_certificates do |t|
      t.references :category, foreign_key: true
      t.references :certificate, foreign_key: true

      t.timestamps
    end
  end
end

class CreateImageUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :image_urls do |t|
      t.string :url
      t.string :fetched_from
      t.references :user, foreign_key: true
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end

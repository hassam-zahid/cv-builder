class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.integer :profile_image_id
      t.string :log

      t.timestamps
    end
  end
end

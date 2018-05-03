class CreateResumesSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :resumes_skills do |t|
      t.references :resume, foreign_key: true
      t.references :skill, foreign_key: true
      t.integer :rate_skill #it can be 1 to 5
      t.boolean :is_active, default: true
      t.text :activation_logs 
      t.integer :arrangment_number

      t.timestamps
    end
  end
end

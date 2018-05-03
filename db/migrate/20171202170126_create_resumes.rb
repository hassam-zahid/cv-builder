class CreateResumes < ActiveRecord::Migration[5.1]
  def change
    create_table :resumes do |t|
      t.string :title
      t.string :experience
      t.string :global_key
      t.references :profile, foreign_key: true
      t.integer :image_id
      t.string :completion_ratio #completion ration for all resume related models, certificates, skills...
      t.boolean :is_active, default: true
      t.string :resume_designation
      t.text :objective 
      
      t.timestamps
    end
    add_index :resumes, :global_key
  end
end

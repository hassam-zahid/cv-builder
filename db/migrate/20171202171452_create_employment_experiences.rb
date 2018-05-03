class CreateEmploymentExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :employment_experiences do |t|
      t.references :job_title, foreign_key: true
      t.references :company, foreign_key: true
      t.references :resume, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.text :description
      t.string :global_key
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end

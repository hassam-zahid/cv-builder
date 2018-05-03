class CreateCompaniesJobTitles < ActiveRecord::Migration[5.1]
  def change
    create_table :companies_job_titles do |t|
      t.references :company, foreign_key: true
      t.references :job_title, foreign_key: true

      t.timestamps
    end
  end
end

class CreateDegreesResumes < ActiveRecord::Migration[5.1]
  def change
    create_table :degrees_resumes do |t|
      t.references :degree, foreign_key: true
      t.references :resume, foreign_key: true
      t.date :degree_year

      t.timestamps
    end
  end
end

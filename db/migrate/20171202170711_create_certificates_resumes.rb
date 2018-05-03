class CreateCertificatesResumes < ActiveRecord::Migration[5.1]
  def change
    create_table :certificates_resumes do |t|
      t.references :certificate, foreign_key: true
      t.references :resume, foreign_key: true
      t.date :certificate_year

      t.timestamps
    end
  end
end

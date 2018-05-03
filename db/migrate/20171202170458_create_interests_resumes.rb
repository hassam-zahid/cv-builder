class CreateInterestsResumes < ActiveRecord::Migration[5.1]
  def change
    create_table :interests_resumes do |t|
      t.references :interest, foreign_key: true
      t.references :resume, foreign_key: true

      t.timestamps
    end
  end
end

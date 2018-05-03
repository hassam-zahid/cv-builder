class CreateJobTitles < ActiveRecord::Migration[5.1]
  def change
    create_table :job_titles do |t|
      t.string :name
      t.string :global_key
      
      t.timestamps
    end
    add_index :job_titles, :name
  end
end

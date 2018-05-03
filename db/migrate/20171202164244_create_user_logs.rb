class CreateUserLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :user_logs do |t|
      t.string :activity
      t.string :data
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

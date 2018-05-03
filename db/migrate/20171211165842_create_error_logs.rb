class CreateErrorLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :error_logs do |t|
      t.string :error_place
      t.string :error_class
      t.string :error_message
      t.text :error_backtrace
      t.integer :fixed_by
      t.boolean :is_fixed, default: false
      t.integer :priority

      t.timestamps
    end
  end
end

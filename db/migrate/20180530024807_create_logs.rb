class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.string :description
      t.integer :error_code
      t.string :status

      t.timestamps
    end
  end
end

class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|
      t.text :answerwhy
      t.string :experience
      t.string :qa
      t.string :favoritegame
      t.string :genre
      t.text :message
      t.references :user, foreign_key: true
      t.references :play, foreign_key: true
      t.string :status
      t.string :status_by

      t.timestamps
    end
  end
end

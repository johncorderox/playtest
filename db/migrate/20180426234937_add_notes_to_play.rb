class AddNotesToPlay < ActiveRecord::Migration[5.0]
  def change
    add_column :plays, :notes, :text
  end
end

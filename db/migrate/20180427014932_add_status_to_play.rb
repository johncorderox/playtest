class AddStatusToPlay < ActiveRecord::Migration[5.0]
  def change
    add_column :plays, :status, :string
  end
end

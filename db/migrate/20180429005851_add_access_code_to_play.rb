class AddAccessCodeToPlay < ActiveRecord::Migration[5.0]
  def change
    add_column :plays, :access_code, :string
  end
end

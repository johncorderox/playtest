class AddAccessCodeToApplication < ActiveRecord::Migration[5.0]
  def change
    add_column :applications, :access_code, :string
  end
end

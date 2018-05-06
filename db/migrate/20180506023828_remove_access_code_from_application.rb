class RemoveAccessCodeFromApplication < ActiveRecord::Migration[5.0]
  def change
    remove_column :applications, :access_code, :string
  end
end

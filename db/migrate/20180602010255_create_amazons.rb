class CreateAmazons < ActiveRecord::Migration[5.0]
  def change
    create_table :amazons do |t|
      t.string :region
      t.string :bucket
      t.string :access_key_id
      t.string :secret_access_key

      t.timestamps
    end
  end
end

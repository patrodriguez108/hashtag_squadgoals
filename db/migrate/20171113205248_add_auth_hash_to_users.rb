class AddAuthHashToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :auth_hash, :string
  end
end

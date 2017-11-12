class AddProfilePicToUsers < ActiveRecord::Migration[5.1]
  def change
    add_attachment :users, :profile_pic
  end
end


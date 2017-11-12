class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :given_name,  null: false
      t.string :family_name,  null: false
      t.string :username,  null: false
      t.string :email,              null: false, default: ""
      t.string :password_digest, null: false, default: ""

      t.timestamps
    end
  end
end

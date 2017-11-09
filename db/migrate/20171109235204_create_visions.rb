class CreateVisions < ActiveRecord::Migration[5.1]
  def change
    create_table :visions do |t|
      t.text :statement
      t.date :timeframe
      t.integer :user_id

      t.timestamps
    end
  end
end

class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.text :content
      t.date :by_when
      t.boolean :private
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end

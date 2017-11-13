class CreateSubGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :sub_goals do |t|
      t.text :content
      t.integer :goal_id
      t.boolean :complete, default: false

      t.timestamps
    end
  end
end

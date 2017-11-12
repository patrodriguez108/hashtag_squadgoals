class CreateSubGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :sub_goals do |t|
      t.text :content
      t.date :by_when
      t.integer :goal_id

      t.timestamps
    end
  end
end

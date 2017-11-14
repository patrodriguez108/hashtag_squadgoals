class CreateProjectGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :project_goals do |t|
    	t.text :content
    	t.date :by_when
    	t.integer :project_id

      t.timestamps
    end
  end
end

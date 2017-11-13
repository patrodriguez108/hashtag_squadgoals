class ChangeProjectGoalsToProjectObjectives < ActiveRecord::Migration[5.1]
  def change
  	rename_table :project_goals, :project_objectives
  end
end

class CreateCollaborations < ActiveRecord::Migration[5.1]
  def change
    create_table :collaborations do |t|
      t.integer :status_id
      t.integer :collaborator_id
      t.integer :project_id

      t.timestamps
    end
  end
end

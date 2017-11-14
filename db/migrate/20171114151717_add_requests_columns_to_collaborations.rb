class AddRequestsColumnsToCollaborations < ActiveRecord::Migration[5.1]
  def change
  	remove_column :collaborations, :status_id
  	add_column :collaborations, :request_id, :integer
  end
end

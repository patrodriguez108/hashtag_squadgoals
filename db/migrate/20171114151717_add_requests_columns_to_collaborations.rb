class AddRequestsColumnsToCollaborations < ActiveRecord::Migration[5.1]
  def change
  	remove_column :collaborations, :collaborator_id
  	add_column :collaborations, :request_sender_id, :integer
  	add_column :collaborations, :request_receiver_id, :integer
  end
end

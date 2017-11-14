class CreateCollaborationRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :collaboration_requests do |t|
      t.integer :request_sender_id
      t.integer :request_receiver_id
      t.integer :status_id

      t.timestamps
    end
  end
end

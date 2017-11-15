class AddProposalToCollabRequest < ActiveRecord::Migration[5.1]
  def change
  	add_column :collaboration_requests, :proposal, :string, limit: 120
  end
end

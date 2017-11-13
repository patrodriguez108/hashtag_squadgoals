class AddSentRequestColumn < ActiveRecord::Migration[5.1]
  def change
  	add_column :collaborations, :sent_request, :boolean, default: false
  end
end

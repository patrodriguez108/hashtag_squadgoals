class ChangeNameToRequestStatuses < ActiveRecord::Migration[5.1]
  def change
  	rename_table :connection_statuses, :request_statuses
  end
end

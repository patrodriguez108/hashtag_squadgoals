class CreateConnectionStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :connection_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end

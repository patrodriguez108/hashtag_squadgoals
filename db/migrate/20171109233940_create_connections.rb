class CreateConnections < ActiveRecord::Migration[5.1]
  def change
    create_table :connections do |t|
      t.integer :champ_id
      t.integer :squad_member_id
      t.integer :status_id

      t.timestamps
    end
  end
end

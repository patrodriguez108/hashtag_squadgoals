class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name, default: "New Project"
      t.text :description, default: "[enter description here]"

      t.timestamps
    end
  end
end

class AddPhotoToProjects < ActiveRecord::Migration[5.1]
  def change
  	add_attachment :projects, :project_pic
  end
end

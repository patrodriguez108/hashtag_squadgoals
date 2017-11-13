class CollaborationsController < ApplicationController

	def new
		@user = User.find(params[:user_id])
	end

	def create
		project = Project.create
		current_user_collaboration = Collaboration.new(
			collaborator_id: current_user.id, 
			project: project)
		current_user_collaboration.status = RequestStatus.find(1)
		requested_collaboration = Collaboration.create(
			collaborator_id: params[:user_id], 
			project: project)
		requested_collaboration.status = RequestStatus.find(1)
		current_user_collaboration.save && requested_collaboration.save
		redirect_to user_path(current_user.id)
	end
end
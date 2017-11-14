class CollaborationsController < ApplicationController

	def index
		@collaborations = current_user.collaborations.where(status_id: 1)
	end

	def new
		@user = User.find(params[:user_id])
	end

	def show
		@current_user_collaboration = Collaboration.find(params[:id])
	end

	def create
		project = Project.create

		current_user_collaboration = Collaboration.new(
			collaborator_id: current_user.id, 
			project: project, sent_request: true)
		current_user_collaboration.status = RequestStatus.find(1)

		requested_collaboration = Collaboration.create(
			collaborator_id: params[:user_id], 
			project: project)
		requested_collaboration.status = RequestStatus.find(1)

		current_user_collaboration.save && requested_collaboration.save
		
		redirect_to user_path(current_user.id)
	end

	def accept
		requested_collaboration = Collaboration.find_by(collaborator_id: params[:user_id], status_id: 1, sent_request: true)
		current_user_collaboration = Collaboration.find_by(collaborator_id: current_user.id, status_id: 1, project: requested_collaboration.project)
		requested_collaboration.status_id = 2
		requested_collaboration.save
		current_user_collaboration.status_id = 2
		current_user_collaboration.save
		redirect_to projects_path
	end
end
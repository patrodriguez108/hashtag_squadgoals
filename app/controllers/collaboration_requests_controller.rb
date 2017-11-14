class CollaborationRequestsController < ApplicationController

	def index
		@collaboration_requests = CollaborationRequest.where(request_receiver: current_user, status_id: 1)
	end

	def new
		@user = User.find(params[:user_id])
	end

	def show
		@collaboration_request = CollaborationRequest.find_by(id: params[:id], request_sender_id: params[:user_id])
	end

	def create
		collaboration_request = CollaborationRequest.new(request_receiver_id: params[:user_id], request_sender: current_user)
		collaboration_request.status = RequestStatus.find(1)

		collaboration_request.save

		redirect_to user_path(current_user.id)
	end

	def accept
		collaboration_request = CollaborationRequest.find_by(id: params[:id], request_receiver_id: current_user.id, request_sender_id: params[:user_id])
		collaboration_request.status = RequestStatus.find(2)
		collaboration_request.save

		project = Project.new

		receiver_collaboration = Collaboration.new(project: project, collaborator: collaboration_request.request_receiver, request: collaboration_request)
		sender_collaboration = Collaboration.new(project: project, collaborator: collaboration_request.request_sender, request: collaboration_request)

		receiver_collaboration.save && sender_collaboration.save

		redirect_to user_path(current_user.id)
	end

	def decline
		collaboration_request = CollaborationRequest.find_by(id: params[:id], request_receiver_id: current_user.id, request_sender_id: params[:user_id])
		collaboration_request.status = RequestStatus.find(3)
		collaboration_request.save

		redirect_to user_path(current_user.id)
	end
end
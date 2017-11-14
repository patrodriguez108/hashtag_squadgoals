class CollaborationRequestsController < ApplicationController

	def new
		@collaboration_requests = CollaborationRequest.where(request_receiver: current_user, status_id: 1)
	end

end
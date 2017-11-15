class AcceptedCollabRequestMailer < ApplicationMailer
	default from: "app.squadgoals@gmail.com"

	def accepted_collab_request(requester, acceptor)
		@requester = requester
		@acceptor = acceptor
		mail(to: @requester.email, subject: "Collaboration Request Accepted")
	end
end
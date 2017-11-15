class AcceptedNotificationMailer < ApplicationMailer
	default from: "app.squadgoals@gmail.com"

	def accepted_notification(requester, acceptor)
		@requester = requester
		@acceptor = acceptor
		mail(to: @requester.email, subject: "Accepted Request")
	end
end
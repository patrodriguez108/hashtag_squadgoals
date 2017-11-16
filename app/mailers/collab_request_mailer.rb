class CollabRequestMailer < ApplicationMailer
  default from: "app.squadgoals@gmail.com"

  def collab_request(requester, receiver)
    @requester = requester
    @receiver = receiver
    mail(to: @receiver.email, subject: "#{@requester.full_name} Wants to Collaborate with You")
  end
end

class ConnectionRequestMailer < ApplicationMailer
  default from: "app.squadgoals@gmail.com"

  def connection_request(requester, receiver)
    @requester = requester
    @receiver = receiver
    mail(to: @receiver.email, subject: "#{@requester.full_name} Wants to Connect with You")
  end
end

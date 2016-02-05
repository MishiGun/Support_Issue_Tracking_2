class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def create_ticket(ticket)
    	@ticket = ticket
		mail(to: @ticket.email, subject: "Congratulation, you create ticket")
	end
end

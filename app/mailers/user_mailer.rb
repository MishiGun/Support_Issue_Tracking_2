class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  	def create_ticket(ticket)
    	@ticket = ticket
		mail(to: @ticket.email, subject: "Congratulation, you create ticket")
	end

	def answer_status(answer)
		@answer = answer
		mail(to: @answer.ticket.email, subject: "Your ticket has new answer")		
	end

	def update_ticket(ticket)
		@ticket = ticket
		mail(to: @ticket.email, subject: "Your ticket has new status")
	end
end

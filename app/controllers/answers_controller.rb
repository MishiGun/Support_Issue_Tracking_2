class AnswersController < ApplicationController

  def index
	@answers = Answer.all
  end

  def new
	@answer = Answer.new
  end

  def create
    answer = Answer.new(answer_params)
    @ticket = Ticket.find(params[:ticket_id])
	  if user_signed_in?
	    answer.user_id = current_user.id
    	if answer.save
   		  UserMailer.answer_status(answer).deliver
		    flash[:success] = "Answer deliver."
		  else
		    flash.now[:error] = "You have errors!"
		  end
      redirect_to ticket_path(answer.ticket_id)
    else
      answer.save
      redirect_to ticket_path(Ticket.find(answer.ticket_id).key)
    end
  end

  def destroy
    @answer.destroy
  end
	
  private

  def answer_params
  	params.require(:answer).permit(:answer_text).merge(ticket_id: params[:ticket_id])
  end

end

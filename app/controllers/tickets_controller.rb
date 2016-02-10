class TicketsController < ApplicationController

	before_filter :authenticate_user!, except: [:new, :create, :show]
	 
	def index
		@tickets = Ticket.all
	end

	def new
		@ticket = Ticket.new 
	end

	def create
    @ticket = Ticket.new(ticket_params)
    if user_signed_in?
      redirect_to @ticket and return
    end
    key = "#{('A'..'Z').to_a.sample(3).join}-#{rand(100000..999999)}"
    @ticket.key = key
    @ticket.status = "Waiting for Staff Response"
		if @ticket.save
      UserMailer.create_ticket(@ticket).deliver
      flash[:success] = "Ticket created! Check your mail."
			redirect_to(action: "show", id: @ticket.key)
   	else
   		flash.now[:error] = "You have errors in your form!"
   		render "new"
    end
  end
		
	def destroy
    @ticket.destroy
  end

	def update
    @ticket = Ticket.find_by(key: params[:id])
    @ticket.update_attributes(params[:ticket])
    redirect_to(action: "show", id: @ticket.key)
	end

	def show
    if user_signed_in?
    	@ticket = Ticket.find_by(id: params[:id])
    else
    	@ticket = Ticket.find_by(key: params[:id])
    end
  end

	private

	def ticket_params
    params.require(:ticket).permit(:key, :name, :email, :department, :subject, :text)
  end

end

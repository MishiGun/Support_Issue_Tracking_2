class TicketsController < ApplicationController

	before_filter :authenticate_user!, except: [:new, :create, :show]
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
		
  def index
    @tickets = Ticket.all
    @tickets = @tickets.filter_status(filter_params[:filter_status]) if filter_params[:filter_status].present?
		@tickets = Ticket.search{fulltext params[:search]}.results if params[:search].present?
  end

	def new
		@ticket = Ticket.new
	end

	def create
    @ticket = Ticket.new(ticket_params)
    if user_signed_in?
      redirect_to tickets_url
      flash[:error] = "Ticket create only customer"
      return
    end
    key = "#{('A'..'Z').to_a.sample(3).join}-#{rand(100000..999999)}"
    @ticket.key = key
    @ticket.status = Status.find_by(status_type: 'Waiting for Staff Response').status_type
		if @ticket.save
      UserMailer.create_ticket(@ticket).deliver
      flash[:success] = "Ticket created! Check your mail."
			redirect_to(action: "show", id: @ticket.key)
   	else
   		flash[:error] = "You have errors in your form!"
   		render "new"
    end
  end
		
	def destroy
    @ticket.destroy
    redirect_to tickets_url
    flash[:success] = 'Ticket was successfully destroyed.'
  end

	def update
    if signed_in?
      @ticket.update_attributes(ticket_params)
      UserMailer.update_ticket(@ticket).deliver
      flash[:success] = 'Email deliver'
      redirect_to tickets_url
    else
      @ticket = Ticket.find_by(key: params[:id])
      @ticket.update_attributes(params[:ticket])
      redirect_to(action: "show", id: @ticket.key)
    end
  end

	def show
    if user_signed_in?
    	@ticket = Ticket.find_by(params[:key])
    else
      @ticket = Ticket.find_by(key: params[:id])
    end
  end

	private

  def set_ticket
    @ticket = Ticket.find_by_id(params[:id])
  end

	def ticket_params
    params.require(:ticket).permit(:key, :name, :email, :department, :subject, :text, :status, :staff_name)
  end

  def filter_params
    params.permit(:filter_status)
  end

end

class StatusesController < ApplicationController

  before_action :set_status, only: [:show, :edit, :update, :destroy]

  def index
  	@statuses = Status.all
    @status = Status.new
    @n = 1
  end

  def new
    @status = Status.new
  end

  def create
  	@status = Status.new(status_params)
    if @status.save
      flash[:success] = "Status created."
      redirect_to statuses_url
    else
      flash[:error] = "You have errors in your form!"
      redirect_to statuses_url
    end
  end

  def destroy
    @status.destroy
    flash[:success] = "Status deleted."
    redirect_to statuses_url
  end

  private

  def set_status
    @status = Status.find_by_id(params[:id])
  end

  def status_params
  	params.require(:status).permit(:status_type)
  end

end

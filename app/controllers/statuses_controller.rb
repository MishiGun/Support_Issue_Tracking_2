class StatusesController < ApplicationController

  def index
  	@statutes = Status.all
  end

  def new
  	@status = Status.new
  end

  def create
  	@status = Status.new(status_params)
  end

  private

  def status_params
  	params.require(:status).permit(:status_type)
  end

end

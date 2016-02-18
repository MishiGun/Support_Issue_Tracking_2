class DepartmentsController < ApplicationController

  before_action :set_department, only: [:show, :edit, :update, :destroy]

  def index
  	@departments = Department.all
    @department = Department.new
    @n = 1
  end

  def new
  	@department = Department.new
  end

  def create
  	@department = Department.new(department_params)
    if @department.save
      flash[:success] = "Department created."
      redirect_to departments_url
    else
      flash[:error] = "You have errors!"
      redirect_to departments_url
    end
  end

  def destroy
    @department.destroy
    flash[:success] = "Department deleted."
    redirect_to departments_url
  end

  private

  def set_department
    @department = Department.find_by_id(params[:id])
  end

  def department_params
  	params.require(:department).permit(:department_type)
  end

end

class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    @user = User.new
    @n = 1
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
    if @user.save
      flash[:success] = "User created."
      redirect_to users_url
    else
      flash[:error] = "You have errors!"
      redirect_to users_url
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  private

  def set_user
    @user = User.find_by_id(params[:id])
  end

  def user_params
  	params.require(:user).permit(:user_name, :email, :password)
  end

end
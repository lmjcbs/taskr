class UsersController < ApplicationController
  before_action :logged_in?, only: :home
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user] = @user.id
      redirect_to home_path
    else
      redirect_to signup_path
    end
  end

  def home
    @user = User.find_by(id: session[:user])
    render 'index'
  end

  private 

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
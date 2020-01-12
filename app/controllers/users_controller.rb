class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to home_path
    else
      redirect_to signup_path
    end
  end

  def home
    set_user
    render 'index'
  end

  private 

  def set_user
    @user = User.find_by(id: session[:user_id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
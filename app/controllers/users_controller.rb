class UsersController < ApplicationController
  def new
    @user = User.new
  end

  private 

  def set_user
    User.find_by(id: session[:user_id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
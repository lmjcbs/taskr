class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user.try(:authenticate, params[:password])
      session[:user] = @user.id
      redirect_to home_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session.delete :user
    redirect_to login_path
  end
end

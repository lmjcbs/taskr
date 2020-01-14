class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :set_user

  def logged_in?
    session[:user]
  end

  def set_user
    redirect_to login_path unless logged_in?
    @user ||= User.find_by(id: session[:user])
  end
end

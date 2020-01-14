class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @user ||= User.find_by(id: session[:user])
  end

  def logged_in?
    redirect_to login_path if current_user.nil?
  end
end

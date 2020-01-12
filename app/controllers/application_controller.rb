class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    redirect_to login_path unless session[:user_id]
  end
end

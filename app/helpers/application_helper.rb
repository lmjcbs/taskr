module ApplicationHelper
  def user_created?(resource)
    resource.user_id == session[:user]
  end
end

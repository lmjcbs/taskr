module ApplicationHelper
  def user_created?(resource)
    resource.user == current_user
  end
end

module ApplicationHelper
  def manager(user)
    current_user && current_user == user
  end
end

class ApplicationController < ActionController::Base
  include Apotomo::Rails::ControllerMethods

  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_path, :alert => exception.message
  end

  has_widgets do |root|
    root << widget(:login_info, 'login_info', :display)
    root << widget(:main_menu, 'main_menu', :display)
    root << widget(:recent_comments, 'recent_comments', :display)
    root << widget(:album_list, 'album_list', :display)
    root << widget(:track_list, 'track_list', :display)
  end
end

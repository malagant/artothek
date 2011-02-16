class ApplicationController < ActionController::Base
  include Apotomo::Rails::ControllerMethods

  protect_from_forgery

  has_widgets do |root|
    root << widget(:login_info, 'login_info', :display)
    root << widget(:main_menu, 'main_menu', :display)
  end
end

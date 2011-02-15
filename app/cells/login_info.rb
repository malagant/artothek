class LoginInfo < Apotomo::Widget
  include Devise::Controllers::Helpers

  helper_method :current_user

  def display
    render
  end
end

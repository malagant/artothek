require 'test_helper'

class LoginInfoTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:login_info, 'login_info', :display)
  end
  
  test "display" do
    render_widget 'login_info'
    assert_select "p"
  end
end

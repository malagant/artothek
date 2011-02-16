require 'test_helper'

class MainMenuTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:main_menu, 'me')
  end
  
  test "display" do
    render_widget 'me'
    assert_select "h1"
  end
end

require 'test_helper'

class RecentCommentsTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:recent_comments, 'me')
  end
  
  test "display" do
    render_widget 'me'
    assert_select "h1"
  end
end

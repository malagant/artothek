require 'test_helper'

class CommentsTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:comments, 'me')
  end
  
  test "display" do
    render_widget 'me'
    assert_select "h1"
  end
end

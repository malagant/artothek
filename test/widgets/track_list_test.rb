require 'test_helper'

class TrackListTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:track_list, 'me')
  end
  
  test "display" do
    render_widget 'me'
    assert_select "h1"
  end
end

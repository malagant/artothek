require 'test_helper'

class AlbumDetailsTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:album_details, 'me')
  end
  
  test "display" do
    render_widget 'me'
    assert_select "h1"
  end
end

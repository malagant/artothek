require 'test_helper'

class AlbumListTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:album_list, 'me')
  end
  
  test "display" do
    render_widget 'me'
    assert_select "h1"
  end
end

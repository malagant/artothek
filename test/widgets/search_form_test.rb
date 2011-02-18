require 'test_helper'

class SearchFormTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:search_form, 'me')
  end
  
  test "display" do
    render_widget 'me'
    assert_select "h1"
  end
end

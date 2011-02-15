require 'spec_helper'

describe "albums/new.html.haml" do
  before(:each) do
    assign(:album, stub_model(Album,
      :title => "MyString",
      :subtitle => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new album form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => albums_path, :method => "post" do
      assert_select "input#album_title", :name => "album[title]"
      assert_select "input#album_subtitle", :name => "album[subtitle]"
      assert_select "textarea#album_description", :name => "album[description]"
    end
  end
end

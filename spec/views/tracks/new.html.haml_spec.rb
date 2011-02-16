require 'spec_helper'

describe "tracks/new.html.haml" do
  before(:each) do
    assign(:track, stub_model(Track,
      :title => "MyString",
      :duration => 1
    ).as_new_record)
  end

  it "renders new track form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tracks_path, :method => "post" do
      assert_select "input#track_title", :name => "track[title]"
      assert_select "input#track_duration", :name => "track[duration]"
    end
  end
end

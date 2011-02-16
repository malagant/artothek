require 'spec_helper'

describe "tracks/edit.html.haml" do
  before(:each) do
    @track = assign(:track, stub_model(Track,
      :title => "MyString",
      :duration => 1
    ))
  end

  it "renders the edit track form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tracks_path(@track), :method => "post" do
      assert_select "input#track_title", :name => "track[title]"
      assert_select "input#track_duration", :name => "track[duration]"
    end
  end
end

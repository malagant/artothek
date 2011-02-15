require 'spec_helper'

describe "albums/show.html.haml" do
  before(:each) do
    @album = assign(:album, stub_model(Album,
      :title => "Title",
      :subtitle => "Subtitle",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Subtitle/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end

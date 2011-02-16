Given /^the following artists:$/ do |artists|
  Artist.create!(artists.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) artist$/ do |pos|
  visit artists_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following artists:$/ do |expected_artists_table|
  expected_artists_table.diff!(tableish('table tr', 'td,th'))
end

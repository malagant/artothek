Given /^the following albums:$/ do |albums|
  Album.create!(albums.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) album$/ do |pos|
  visit albums_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following albums:$/ do |expected_albums_table|
  expected_albums_table.diff!(tableish('table tr', 'td,th'))
end

Given /^An existing album with "([^\"]*)" "([^\"]*)"$/ do |title, value|
  @album ||= Album.make!(title => value)
end
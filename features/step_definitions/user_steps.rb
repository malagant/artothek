Given /^the following users:$/ do |users|
  User.create!(users.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) user$/ do |pos|
  visit users_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following users:$/ do |expected_users_table|
  expected_users_table.diff!(tableish('table tr', 'td,th'))
end

When /^I am registered as "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  User.new(:email => email,
           :password => password,
           :password_confirmation => password).save!
end

When /^I am logged in as "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  When %[I am registered as "#{email}" with password "#{password}"]
  And %[I go to the sign in page]
  And %[I fill in "Email" with "#{email}"]
  And %[I fill in "Password" with "#{password}"]
  And %[I press "Sign in"]
end
Given /^I am not authenticated$/ do
  visit destroy_user_session_path
end
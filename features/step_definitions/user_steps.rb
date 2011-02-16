Given /^the following users:$/ do |users|
  users.hashes.each do |user_data|
    User.make!(user_data)
  end
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
  @user ||= User.make!(:email => email,
             :password => password,
             :password_confirmation => password)
end

When /^I am logged in as "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  @user ||= User.make!(:email => email,
             :password => password,
             :password_confirmation => password)
  When %[I go to the sign in page]
  And %[I fill in "Email" with "#{email}"]
  And %[I fill in "Password" with "#{password}"]
  And %[I press "Sign in"]
end

Given /^I am not authenticated$/ do
  visit destroy_user_session_path
end
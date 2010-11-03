Given /^A family wants to register$/ do
end

When /^They click on the register button$/ do
  visit root_path
  follow_redirect!
  click_link "Register"
end

Then /^they get a registration form$/ do
  response.should contain("Register")
end

##

Given /^A family is at the registration form page$/ do
  visit new_family_path
  response.should contain("Register")
end

When /^They fillout and submit the registration form$/ do
  save_and_open_page
  fill_in "family_login", :with => "johnson"
  fill_in "family_name", :with => "Johson"
  fill_in "family_password", :with => "foobar"
  fill_in "family_password_confirmation", :with => "foobar"
  fill_in "family_email", :with => "foo@bar.com"
  fill_in "family_email_confirmation", :with => "foo@bar.com"
  click_button "family_submit"
  save_and_open_page
end

Then /^A new family is created for them$/ do
  debugger
  Family.find_by_login('johnson').should_not == nil
end

Then /^they are sent to the login page$/ do
  response.should contain("family_session[login]")
end

Then(/^I verify text "([^"]*)" on Sign up page$/) do |text|
  expect(@sign_up.header.text).to eq(text)
end

Given(/^I navigate to Sign up page$/) do
  @sign_up.visit
  sleep 3
end

When(/^I verify the Sign up page loaded$/) do
  @sign_up.page_loaded
end

Then(/^I enter login "([^"]*)"$/) do |email_id|
  @sign_up.send_login(email_id)
end

And(/^I enter password "([^"]*)"$/) do |password|
  @sign_up.send_password(password)
end

Then(/^I enter date of birth "([^"]*)"$/) do |dob|
  @sign_up.send_date_of_birth(dob)
end

And(/^I click on checkbox$/) do
  @sign_up.click_checkbox
end

Then(/^I click Create Account button$/) do
  @sign_up.click_create_acc_button
end
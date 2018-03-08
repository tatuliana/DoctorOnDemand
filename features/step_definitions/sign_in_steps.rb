Then(/^I verify text "([^"]*)" on Sign in page$/) do |text|
  expect(@sign_in.header.text).to eq(text)
end

Given(/^I navigate to Sign in page$/) do
  @sign_in.visit
  sleep 3
end

When(/^I verify the Sign in page loaded$/) do
  @sign_in.page_loaded
end

When(/^I enter valid login and password using environment variables$/) do
  @sign_in.login_with_env_var
  @sign_in.password_with_env_var
end

Then(/^I click Sign in button$/) do
  @sign_in.click_sign_in_button
  # sleep 3
end

Then(/^I try to sign in with "([^"]*)" and "([^"]*)"$/) do |login, password|
  @sign_in.login_with_cred(login)
  @sign_in.password_with_cred(password)
end

When(/^I verify the homepage loaded$/) do
  @home_page.page_loaded
end

When(/^I click on header link "([^"]*)"$/) do |header_link|
  @home_page.click_info_header_link(header_link)
  sleep 2
end

Then(/^I click on membership header link "([^"]*)"$/) do |header_link|
  @home_page.click_membership_header_link(header_link)
  sleep 2
end

Then(/^I verify text "([^"]*)" on the loaded page$/) do |text|
  expect(@home_page.header.text).to eq(text)
end

Then(/^I switch to new window$/) do
  @home_page.switch_to_window
  sleep 3
end

Then(/^I scroll to the bottom of the page$/) do
  @home_page.scroll_to_bottom
end

Then(/^I click on link "([^"]*)" in footer$/) do |footer_link|
  @home_page.click_footer_link(footer_link)
  sleep 2
end

And(/^I verify footer related text "([^"]*)" on the loaded page$/) do |text|
  expect(@home_page.footer.text).to eq(text)
end

Then(/^I verify page title "([^"]*)" on the loaded page$/) do |page_title|
  sleep 5
  expect(@home_page.page_title).to eq(page_title)
end

And(/^I verify that blog page url is "([^"]*)"$/) do |url|
  expect(@home_page.page_url).to eq(url)
end

And(/^I verify that search field is present on the page$/) do
  expect(@home_page.search_field.displayed?).to be true
end

Then(/^I click on appstore link "([^"]*)" in footer$/) do |app_store_link|
  @home_page.click_app_store_link(app_store_link)
end


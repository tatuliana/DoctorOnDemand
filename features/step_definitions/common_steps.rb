Given(/^I login with valid credentials$/) do
  steps %(
    Given I navigate to Sign in page
    When I verify the Sign in page loaded
    Then I enter valid login and password using environment variables
    Then I click Sign in button
    And I verify the user logged in
  )
end

# TODO: "Add any common steps to this file"

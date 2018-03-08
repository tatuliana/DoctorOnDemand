@acceptance @join
Feature: Sign up page
  Scenario: New user can register a new account
    Given I navigate to Sign up page
    When I verify the Sign up page loaded
    Then I enter login "test@test.com"
    And I enter password "Password1"
    Then I enter date of birth "10/20/1990"
    And I click on checkbox
#    Then I click Create Account button
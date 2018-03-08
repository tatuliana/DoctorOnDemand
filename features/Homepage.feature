@acceptance @home
Feature: Homepage
  Scenario Outline: working with info links in header (links open in the same window)
    Given I verify the homepage loaded
    Then I click on header link "<info_header_link>"
    Then I verify text "<text>" on the loaded page

  Examples:
    | info_header_link    |  text                                                                        |
    | What we treat       | How we can help                                                              |
    | For businesses      | Delivering the best-in-class patient experience to you and your organization |

  Scenario: working with Join link in header
    Given I verify the homepage loaded
    Then I click on membership header link "Join now"
    Then I switch to new window
    And I verify text "See a Doctor Within Minutes" on Sign up page


  Scenario: working with Sign in link in header
    Given I verify the homepage loaded
    Then I click on membership header link "Sign in"
    Then I switch to new window
    And I verify text "Welcome" on Sign in page


  Scenario Outline: working with footer (links open in the same window)
    Given I verify the homepage loaded
    Then I scroll to the bottom of the page
    Then I click on link "<footer_link>" in footer
    And I verify footer related text "<text>" on the loaded page
    Then I verify page title "<page_title>" on the loaded page

    Examples:
    | footer_link      | text                                                                      | page_title                                    |
    | About us         | Improving the world\’s health through compassionate care and innovation.  | Doctor On Demand: About Us                    |
    | Privacy          | Doctor On Demand Privacy Policy                                           | Doctor On Demand: Site Privacy Policy         |
    | Terms of Use     | Doctor on Demand Terms of Use                                             | Doctor On Demand                              |
    | Code of Conduct  | Code of Conduct and Business Ethics.                                      | Doctor On Demand: Code Of Contact             |
    | Contact us       | Improving the world\’s health through compassionate care and innovation.  | Doctor On Demand: About Us                    |
    # Contact us is in the bottom of About us page


  Scenario Outline: working with career links in footer
    Given I verify the homepage loaded
    Then I scroll to the bottom of the page
    Then I click on link "<footer_link>" in footer
    Then I verify page title "<page_title>" on the loaded page

    Examples:
      | footer_link      | page_title                                    |
      | Careers          | Doctor On Demand: About Us - Careers          |
      | Provider Careers | Doctor On Demand: About Us - Provider Careers |


  Scenario Outline: working with social networks links in footer
    Given I verify the homepage loaded
    Then I scroll to the bottom of the page
    Then I click on link "<footer_link>" in footer
    Then I switch to new window
    And I verify page title "<page_title>" on the loaded page

    Examples:
    | footer_link       | page_title                                                        |
    | Facebook          | Doctor On Demand \| Facebook                                      |
    | Twitter           | Doctor On Demand (@drondemand) \| Twitter                         |
    | Instagram         | Doctor On Demand (@doctorondemand) • Instagram photos and videos  |
    | YouTube           | DoctorOnDemand - YouTube - YouTube                                |


  Scenario: working with Blog link in footer
    Given I verify the homepage loaded
    Then I scroll to the bottom of the page
    Then I click on link "Blog" in footer
    Then I switch to new window
    And I verify that blog page url is "https://blog.doctorondemand.com/"


  Scenario: working with Help center link in footer
    Given I verify the homepage loaded
#    Then I scroll to the bottom of the page
    Then I click on link "Help center" in footer
    Then I switch to new window
    And I verify that search field is present on the page


  Scenario Outline: working with App stores links in footer
    Given I verify the homepage loaded
    Then I scroll to the bottom of the page
    Then I click on appstore link "<footer_link>" in footer
    Then I switch to new window
    And I verify page title "<page_title>" on the loaded page

    Examples:
    | footer_link | page_title                                     |
    | apple       | Doctor On Demand on the App Store              |
    | google      | Doctor On Demand - Android Apps on Google Play |


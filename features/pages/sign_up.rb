class SignUp
  include PageActions

  HEADER = {xpath: "//h1"}
  PAGE_LOADED = {xpath: "//div[@class = 'signup-container']/h2[text() = 'Get Started']"}
  LOGIN = {xpath: "//div[@id = 'username-wrapper']/input"}
  PASSWORD = {xpath: "//div[@id = 'password-wrapper']/input[contains(@class, 'form-control')]"}
  DATE_OF_BIRTH = {xpath: "//date-input/input[contains(@class, *)]"}
  CHECKBOX = {xpath: "//div[@id = 'consent']//input"}
  BUTTON = {xpath: "//button/span[text()= 'Create Account']"}


  def header
    @browser.find_element(HEADER)
  end

  def visit
    subdomain = "patient."
    path = "/register/"
    if ENVIRONMENT == :production
      url = URI("https://#{subdomain}#{$base_url}#{path}")
      @browser.navigate.to url
    else
      url = URI("https://#{ENV['ENVIRONMENT']}.#{subdomain}#{$base_url}#{path}")
      @browser.navigate.to url
    end
  end

  def page_loaded
    wait_for(20){@browser.find_element(PAGE_LOADED)}
  end

  def send_login(email_id)
    login =@browser.find_element(LOGIN)
    login.send_keys email_id
  end

  def send_password(password)
    passw = @browser.find_element(PASSWORD)
    passw.send_keys password
  end

  def send_date_of_birth(dob)
    date_of_birth = @browser.find_element(DATE_OF_BIRTH)
    date_of_birth.send_keys dob
  end

  def click_checkbox
    @browser.find_element(CHECKBOX).click
  end

  def click_create_acc_button
    @browser.find_element(BUTTON).click
  end

end
class SignIn
  include PageActions

  HEADER = {xpath: "//div[@class = 'signin-container']/h2"}
  PAGE_LOADED = {xpath: "//h3/*[text()='Sign in to your account']"}
  LOG_IN = {id: "dod-email"}
  PASSW = {id: "dod-password"}
  SIGN_IN_BUTTON = {xpath: "//button[contains(@class, 'btn-danger')]"}
  FORGOT_PASSWORD = {xpath: "//a[contains(@class, 'text-danger')][contains(text(), 'Forgot')][contains(text(), 'password?')]"}
  ERROR_MESSAGE = {xpath: "//section[@class = 'signin']//p[contains(@class, 'alert-danger')][text() = 'Wrong email or password. Try again!']"}


  def header
    @browser.find_element(HEADER)
  end

  def visit
    subdomain = "patient."
    path = "/signin/"
    if ENVIRONMENT == :production
      url = URI("https://#{subdomain}#{$base_url}#{path}")
      @browser.navigate.to url
    else
      url = URI("https://#{ENVIRONMENT}.#{subdomain}#{$base_url}#{path}")
      @browser.navigate.to url
    end
  end

  def page_loaded
    wait_for(20){@browser.find_element(PAGE_LOADED)}
  end

  def login_with_cred (login_cred)
    login = @browser.find_element(LOG_IN)
    login.send_keys login_cred
  end

  def password_with_cred (password_cred)
    password = @browser.find_element(PASSW)
    password.send_keys password_cred
  end

  def login_with_env_var
    login = @browser.find_element(LOG_IN)
    login.send_keys "#{LOGIN}"
  end

  def password_with_env_var
    password = @browser.find_element(PASSW)
    password.send_keys "#{PASSWORD}"
  end

  def click_sign_in_button
    @browser.find_element(SIGN_IN_BUTTON).click
  end

  def forgot_password
    @browser.find_element(FORGOT_PASSWORD)
  end

  def error_message
    @browser.find_elements(ERROR_MESSAGE)
  end

end
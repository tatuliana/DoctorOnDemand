require_relative "../pages/page_actions"

Dir["../pages/*.rb"].each{|file| require_relative file}

driver_path  = File.join(File.dirname(__FILE__), "..", "..", "drivers", "chromedriver")

Before '@wip' do
  skip_this_scenario
end

Before do
    @browser = Selenium::WebDriver.for :chrome, switches: %w[--disable-infobars], driver_path: driver_path
    @browser.manage.window.maximize
    if ENVIRONMENT == :production
      @browser.get "https://#{$base_url}"
    else
      url = URI("https://#{ENV['ENV_LOGIN']}:#{ENV['ENV_PASSWORD']}@#{ENV['ENVIRONMENT']}.#{$base_url}")
      @browser.get url
    end

  # @browser.manage.timeouts.implicit_wait = 10
  # @browser.manage.timeouts.page_load = 12

  @home_page = HomePage.new @browser
  @sign_in = SignIn.new @browser
  @sign_up = SignUp.new @browser
  @patient = Patient.new @browser

end

# AfterStep do
#   @browser.manage.timeouts.implicit_wait = 10
# end

After do |scenario|
  if scenario.failed?
    screenshots_dir = File.join(File.dirname(__FILE__), "..", "..", "screenshots")
    unless File.directory?(screenshots_dir)
      FileUtils.mkdir_p(screenshots_dir)
    end

    time_stamp = Time.now.strftime("%Y-%m-%d_at_%H.%M.%S").to_s
    screenshot_name = "#{time_stamp}_failure_#{scenario.name.gsub(/[^\w`~!@#\$%&\(\)_\-\+=\[\]\{\};:',]/, '-')}.png"
    screenshot_file = File.join(screenshots_dir, screenshot_name)
    @browser.save_screenshot(screenshot_file)
    embed("#{screenshot_file}", 'image/png')
  end
  @browser.quit
end


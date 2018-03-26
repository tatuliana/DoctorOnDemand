class HomePage
  include PageActions

  PAGE_LOADED = {xpath: "//div[contains(@class,'dod-content')]/a[contains(@class, 'dod-logo')]"}
  POPUP = {xpath: "//a[@class='dod-close ng-scope']"}
  HEADER = {xpath: "//h1"}
  FOOTER = {xpath: "//h2"}


  def page_loaded
    wait_for(20){@browser.find_element(PAGE_LOADED)}
  end

  def close_popup
    popup = @browser.find_element(POPUP)
    wait_for(20){popup.displayed?}
    popup.click
  end

  def click_info_header_link (header_link)
    @browser.find_element(xpath: "//div[@class = 'dod-main-nav hidden-xs visible-sm visible-md visible-lg ng-scope']/a[@class = 'ng-binding ng-scope'][contains(text(), '#{header_link}')]").click
  end

  def click_membership_header_link (header_link)
    @browser.find_element(xpath: "//a[contains(text(), '#{header_link}')]").click
  end

  def header
    @browser.find_element(HEADER)
  end

  def click_footer_link (footer_link)
    @browser.find_element(xpath: "//div[@class = 'dod-footer-col-2']/div/a[text() = '#{footer_link}']").click
  end

  def footer
    @browser.find_element(FOOTER)
  end

  def search_field
    @browser.find_element(id: "query")
  end

  def click_app_store_link (app_store_link)
    @browser.find_element(xpath: "//div[contains(@class, 'dod-desktop-footer')]//div/a[contains(@href, '#{app_store_link}')]").click
  end

end
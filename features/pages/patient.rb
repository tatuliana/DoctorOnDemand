class Patient
  include PageActions

  WELCOME_MESS = {xpath: "//div[contains(text(), 'Choose a type of video visit.')]"}


  def welcome_message
    wait_for(20){@browser.find_element(WELCOME_MESS)}
  end
end
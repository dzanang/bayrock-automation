require './lib/base_page'

class LoginPage < BasePage

  ##########################################################
  ##                  LOCATOR METHODS                     ##
  ##########################################################

  def login_username_field
    @browser.text_field(name: 'username')
  end

  def login_password_field
    @browser.text_field(name: 'password')
  end

  def keep_signed_in_checkbox
    @browser.a(xpath: "//div[@class='u-check-icon-checkbox-v6 g-absolute-centered--y g-left-0']")
  end

  def sign_in_button
    @browser.button(xpath: "//button[contains(text(),'Sign In')]")
  end

  def sign_in_linkedin_button
    @browser.link(xpath: "//span[@class='d-inline-block align-self-center ml-5']")
  end

  def sign_up_link
    @browser.link(visible_text: 'Sign Up')
  end

  ##########################################################
  ##                    CLICK METHODS                     ##
  ##########################################################

  def click_sign_in
    wait_present(sign_in_button)
    sign_in_button.click
  end

  def click_linkedin
    wait_present(sign_in_linkedin_button)
    sign_in_linkedin_button.click
  end

  def click_signup
    wait_present(sign_up_link)
    sign_up_link.click
  end

  ##########################################################
  ##                      SET METHODS                     ##
  ##########################################################

  def check_sign_in
    wait_present(sign_in_button)
    sign_in_button.present?
  end

  ##########################################################
  ##                      SET METHODS                     ##
  ##########################################################

  def enter_username(username)
    wait_present(login_username_field)
    login_username_field.set username
  end

  def enter_password(password)
    wait_present(login_password_field)
    login_password_field.set password
  end

end

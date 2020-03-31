class RegisterPage < BasePage

  ##########################################################
  ##                  LOCATOR METHODS                     ##
  ##########################################################

  def first_name
    @browser.text_field(name: "firstName")
  end

  def last_name
    @browser.text_field(name: 'lastName')
  end

  def email
    @browser.text_field(name: 'email')
  end

  def new_password
    @browser.text_field(name: 'newPassword')
  end

  def matching_password
    @browser.text_field(name: 'matchingPassword')
  end

  def password_status_list
    @browser.elements(xpath: "//label[contains(@class, 'col-9')]")
  end

  def terms_and_conditions_checkbox
    @browser.i(xpath: "//i[@class='fa']")
  end

  def sign_up_button
    @browser.button(xpath: "//button[@type='submite']")
  end

  def sign_in_linkedin_button
    @browser.link(xpath: "//span[@class='d-inline-block align-self-center']")
  end

  def sign_in_link
    @browser.link(visible_text: 'Sign In')
  end

  ##########################################################
  ##                    CLICK METHODS                     ##
  ##########################################################

  def click_sign_up
    wait_present(sign_up_button)
    sign_up_button.click
  end

  def click_linkedin_button
    wait_present(sign_in_linkedin_button)
    sign_in_linkedin_button.click
  end

  def click_sign_in
    wait_present(sign_in_link)
    sign_in_link.click
  end

  ##########################################################
  ##                      SET METHODS                     ##
  ##########################################################

  def enter_name(name)
    wait_present(first_name)
    first_name.set name
  end

  def enter_lastname(lastname)
    wait_present(last_name)
    last_name.set lastname
  end

  def enter_email(eml)
    wait_present(email)
    email.set eml
  end

  def enter_password(newpassword)
    wait_present(new_password)
    new_password.set newpassword
  end

  def enter_matching_password(matchingpassword)
    wait_present(matching_password)
    matching_password.set matchingpassword
  end

  def accept_terms
    wait_present(terms_and_conditions_checkbox)
    terms_and_conditions_checkbox.click
  end

  ##########################################################
  ##                    CHECK METHODS                     ##
  ##########################################################

  def check_password_validity
    labels = @browser.elements(xpath: "//label[contains(@class, 'col-9')]")
    labels.all? do |label|
        label.class_name.include?("text-success")
      end
    end
  end

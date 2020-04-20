require './lib/base_page'

class ExternalReferencePage < BasePage
  ##########################################################
  ##                  LOCATOR METHODS                     ##
  ##########################################################

  def reviewer_first_name
    @browser.text_field(name: 'firstName')
  end

  def reviewer_last_name
    @browser.text_field(name: 'lastName')
  end

  def reviewer_email
    @browser.text_field(name: 'email')
  end

  def reviewer_phone
    @browser.text_field(name: 'phoneNumber')
  end

  def reviewer_relationship
    @browser.select_list(id: 'relationship')
  end

  def reviewer_position
    @browser.text_field(name: 'position')
  end

  def reviewer_project
    @browser.text_field(name: 'project')
  end

  def reviewer_industry
    @browser.select_list(id: 'industry')
  end

  def reviewer_cancel_button
    @browser.button(xpath: "//button[contains(text(),'Cancel')]")
  end

  def reviewer_send_button
    @browser.button(xpath: "//button[contains(text(),'Submit')]")
  end

  ##########################################################
  ##                      SET METHODS                     ##
  ##########################################################

  def enter_reviewer_information(firstName, lastName, email, phone, position, project)
    reviewer_first_name.send_keys firstName
    reviewer_last_name.send_keys lastName
    reviewer_email.send_keys email
    reviewer_phone.send_keys phone
    reviewer_relationship.select sample()
    sleep 10
    reviewer_position.send_keys position
    reviewer_project.send_keys project
    reviewer_industry.select sample()
    sleep 10
  end

  ##########################################################
  ##                    CHECK METHODS                     ##
  ##########################################################

  def check_modal_opened
    wait_present(reviewer_email)
    reviewer_email.present?
  end

  ##########################################################
  ##                    CLICK METHODS                     ##
  ##########################################################

  def send_review_request
    wait_present(reviewer_send_button)
    reviewer_send_button.click!
  end
end

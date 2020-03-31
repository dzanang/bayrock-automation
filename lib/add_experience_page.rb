# frozen_string_literal: true
require './lib/base_page'

class AddExperiencePage < BasePage

  ##########################################################
  ##                  LOCATOR METHODS                     ##
  ##########################################################

  def experience_title
    @browser.text_field(name: 'title')
  end

  def experience_company
    @browser.text_field(name: 'company')
  end

  def experience_location
    @browser.text_field(name: 'location')
  end

  def experience_from_date
    @browser.input(id: "fromDate")
  end

  def experience_to_date
    @browser.input(id: 'toDate')
  end

  def experience_currently_work
    @browser.input(name: 'currentlyWork')
  end

  def experience_description
    @browser.textarea(id: 'description')
  end

  def experience_save_button
    @browser.button(text: 'Save')
  end

  def experience_cancel_button
    @browser.button(text: 'Cancel')
  end

  def calendar_previous_button
    @browser.button(class: 'previous')
  end

  def calendar_days
    @browser.elements(xpath: '//td[@class="ng-star-inserted"]/span')
  end

  def day
    @browser.element(xpath: '//tr[1]//td[2]//span[1]')
  end

  ##########################################################
  ##                    CHECK METHODS                     ##
  ##########################################################

  def check_save_button_present?
    wait_present(experience_save_button)
    experience_save_button.present?
  end

  ##########################################################
  ##                    CLICK METHODS                     ##
  ##########################################################

  def click_save_button
    wait_present(experience_save_button)
    experience_save_button.click
  end

  def click_cancel_button
    wait_present(experience_cancel_button)
    experience_cancel_button.click
  end

  ##########################################################
  ##                      SET METHODS                     ##
  ##########################################################

  def enter_title(title)
    wait_present(experience_title)
    experience_title.set title
  end

  def enter_company(company)
    wait_present(experience_company)
    experience_company.set company
  end

  def enter_location(location)
    wait_present(experience_location)
    experience_location.set location
  end

  def enter_from_date(date)
    wait_present(experience_from_date)
    experience_from_date.click
    calendar_previous_button.click
    calendar_days[date].click!
  end

  def enter_to_date(date)
    wait_present(experience_to_date)
    experience_to_date.click
    calendar_previous_button.click
    calendar_days[date].click!
  end

  def set_currently_work
    wait_present(experience_currently_work)
    experience_currently_work.click!
  end

  def enter_description(description)
    wait_present(experience_description)
    experience_description.set description
  end
end

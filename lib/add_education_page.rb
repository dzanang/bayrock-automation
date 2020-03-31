# frozen_string_literal: true
require './lib/base_page'

class AddEducationPage < BasePage

  ##########################################################
  ##                  LOCATOR METHODS                     ##
  ##########################################################

  def education_school
    @browser.text_field(name: 'school')
  end

  def education_degree
    @browser.text_field(name: 'degree')
  end

  def education_field_of_study
    @browser.text_field(name: 'fieldOfStudy')
  end

  def education_from_year
    @browser.text_field(id: 'fromYear')
  end

  def education_to_year
    @browser.text_field(id: 'toYear')
  end

  def education_description
    @browser.textarea(id: 'description')
  end

  def education_save_button
    @browser.button(text: 'Save')
  end

  def education_cancel_button
    @browser.button(text: 'Cancel')
  end

  ##########################################################
  ##                    CHECK METHODS                     ##
  ##########################################################

  def check_education_sb_present?
    wait_present(education_save_button)
    education_save_button.present?
  end

  ##########################################################
  ##                    CLICK METHODS                     ##
  ##########################################################

  def click_education_save_button
    wait_present(education_save_button)
    education_save_button.click
  end

  def click_education_cancel_button
    wait_present(education_cancel_button)
    education_cancel_button.click
  end

  ##########################################################
  ##                      SET METHODS                     ##
  ##########################################################

  def enter_school(school)
    wait_present(education_school)
    education_school.set school
  end

  def enter_degree(degree)
    wait_present(education_degree)
    education_degree.set degree
  end

  def enter_field_of_study(field)
    wait_present(education_field_of_study)
    education_field_of_study.set field
  end

  def enter_from_year(year)
    wait_present(education_from_year)
    education_from_year.set year
  end

  def enter_to_year(year)
    wait_present(education_to_year)
    education_to_year.set year
  end

  def enter_education_description(description)
    wait_present(education_description)
    education_description.set description
  end
end

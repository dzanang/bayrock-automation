require './lib/base_page'

class HomePage < BasePage
  ##########################################################
  ##                  LOCATOR METHODS                     ##
  ##########################################################

  def profile_picture
    @browser.element(class: 'profile_img')
  end

  def upload_picture_button
    @browser.input(id: 'file')
  end

  def experience_plus
    @browser.a(xpath: "//a[@title='Add Experience']")
  end

  def experience_cards
    @browser.elements(xpath: "//div[@id='experience__card']//div[@class='media-body']/div/h5")
  end

  def remove_experience_button
    @browser.element(xpath: "//div[@id='experience__card']//li[1]//div[@class='media-body']/div/span/a[3]")
  end

  def edit_experience_button
    @browser.element(xpath: "//div[@id='experience__card']//li[1]//div[@class='media-body']/div/span/a[2]")
  end

  def remove_education_button
    @browser.element(xpath: "//div[@id='education__card']//li[1]//div[@class='media-body']//div/span/a[2]")
  end

  def confirm_education_delete_button
    @browser.element(id: 'delete-job')
  end

  def confirm_experience_delete_button
    @browser.element(id: 'delete-job')
  end

  def edit_education_button
    @browser.element(xpath: "//div[@id='education__card']//li[1]//div[@class='media-body']/div/span/a[1]")
  end

  def education_plus
    @browser.a(xpath: "//a[@title='Add Education']")
  end

  def education_cards
    @browser.elements(xpath: "//div[@id='education__card']//div[@class='media-body']/div/h5")
  end

  def success_alert
    @browser.element(xpath: "//div[@role='alert']") #"//div[@class='alert alert-dismissible fade show g-bg-teal g-color-white u-shadow-v1-5 rounded-0']")
  end

  def log_out_button
    @browser.element(title: 'Logout')
  end

  def upload_cv_button
    @browser.input(id: 'upload-cv')
  end

  def download_cv_button
    @browser.button(xpath: "//button[contains(text(),'Download CV')]")
  end

  def request_reference_button
    @browser.element(xpath: "//a[@title='Request Reference']")
  end

  ##########################################################
  ##                    CHECK METHODS                     ##
  ##########################################################

  def check_logout_button
    wait_present(log_out_button)
    log_out_button.present?
  end

  def check_experience_added(job_title)
    experience_cards.each do |card|
      return true if card.inner_text.include? job_title
    end
  end

  def check_education_added(education_title)
    education_cards.each do |card|
      return true if card.inner_text.include? education_title
    end
  end

  def check_education_title
    education_cards.each do |card|
      return card.inner_text
    end
  end

  def check_experience_title
    experience_cards.each do |card|
      return card.inner_text
    end
  end

  def check_alert_toast_present
    wait_present(success_alert)
    success_alert.present?
  end

  ##########################################################
  ##                    CLICK METHODS                     ##
  ##########################################################

  def add_new_experience
    wait_present(experience_plus)
    experience_plus.click!
  end

  def delete_test_experience
    wait_present(remove_experience_button)
    remove_experience_button.click!
  end

  def delete_test_education
    wait_present(remove_education_button)
    remove_education_button.click!
  end

  def confirm_education_deletion
    wait_present(confirm_education_delete_button)
    confirm_education_delete_button.click!
  end

  def confirm_experience_deletion
    wait_present(confirm_experience_delete_button)
    confirm_experience_delete_button.click!
  end

  def add_new_education
    wait_present(education_plus)
    education_plus.click!
  end

  def edit_experience
    wait_present(edit_experience_button)
    edit_experience_button.click!
  end

  def edit_education
    wait_present(edit_education_button)
    edit_education_button.click!
  end

  def log_out
    wait_present(log_out_button)
    log_out_button.click!
  end

  def download_cv
    wait_present(download_cv_button)
    download_cv_button.click
  end

  def request_external_reference
    wait_present(request_reference_button)
    request_reference_button.click!
  end

  ##########################################################
  ##                      SET METHODS                     ##
  ##########################################################

  def upload_new_profile_photo(photo)
    wait_exist(upload_picture_button)
    upload_picture_button.send_keys photo
  end

  def upload_new_cv(cv)
    wait_exist(upload_cv_button)
    upload_cv_button.send_keys cv
  end
end

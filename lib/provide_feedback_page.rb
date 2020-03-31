require './lib/base_page'

class ProvideFeedbackPage < BasePage

  ##########################################################
  ##                  LOCATOR METHODS                     ##
  ##########################################################

  def select_project
    @browser.select_list(name: 'newReviewProject')
  end

  def select_person
    @browser.select_list(name: 'newReviewReviewee')
  end

  def worked_from
    @browser.text_field(id: 'fromDate')
  end

  def worked_until
    @browser.text_field(id: 'toDate')
  end

  def overall_slider
    @browser.element(xpath: "//ng5-slider[@id='overallSlider']//span[@role='slider']")
  end

  def technical_skills_slider
    @browser.element(xpath: "//ng5-slider[@id='technicalSkillsSlider']//span[@role='slider']")
  end

  def communication_slider
    @browser.element(xpath: "//ng5-slider[@id='communicationSlider']//span[@role='slider']")
  end

  def commercial_slider
    @browser.element(xpath: "//ng5-slider[@id='commercialSlider']//span[@role='slider']")
  end

  def leadership_slider
    @browser.element(xpath: "//ng5-slider[@id='leadershipSlider']//span[@role='slider']")
  end

  def public_comments
    @browser.textarea(name: 'newReviewNot')
  end

  def private_comments
    @browser.textarea(name: 'newReviewPrivateComment')
  end

  def hours_worked
    @browser.text_field(name: 'newReviewHours')
  end

  def work_again_buttons
    @browser.elements(xpath: "//div[@class='radio__btn_group']/div")
  end

  def calendar_previous_button
    @browser.button(class: 'previous')
  end

  def calendar_days
    @browser.elements(xpath: '//td[@class="ng-star-inserted"]/span')
  end

  def submit_button
    @browser.button(visible_text: 'Send feedback')
  end

  def confirm_send_button
    @browser.button(visible_text: 'Yes')
  end

  def feedback_success_alert
    @browser.element(xpath: "//div[@class='modal ng-tns-c2-0 ng-star-inserted']")
  end

  ##########################################################
  ##                    CLICK METHODS                     ##
  ##########################################################

  def send_feedback
    wait_present(submit_button)
    submit_button.click!
  end

  def confirm_send_feedback
    wait_present(confirm_send_button)
    confirm_send_button.click!
  end


  ##########################################################
  ##                    CHECK METHODS                     ##
  ##########################################################

  def check_public_comments
    wait_present(public_comments)
    public_comments.present?
  end

  def check_success
    wait_present(feedback_success_alert)
    feedback_success_alert.present?
  end

  ##########################################################
  ##                      SET METHODS                     ##
  ##########################################################

  def select_project_list(index)
    wait_present(select_project)
    select_project.select index
  end

  def select_person_list(index)
    wait_present(select_person)
    select_person.select index
  end

  def enter_worked_from(date)
    wait_present(worked_from)
    worked_from.click
    calendar_previous_button.click
    calendar_days[date].click!
  end

  def enter_worked_until(date)
    wait_present(worked_until)
    worked_until.click
    calendar_previous_button.click
    calendar_days[date].click!
  end

  def enter_hours(hours)
    wait_present(hours_worked)
    hours_worked.set hours
  end

  def enter_private_comment(comment)
    wait_present(private_comments)
    private_comments.set comment
  end

  def enter_public_comment(comment)
    wait_present(public_comments)
    public_comments.set comment
  end

  def enter_work_again(choice)
    wait_present(work_again_buttons)
    work_again_buttons.each do |button|
      if button.label.text.include? choice
        button.click
      end
    end
  end

  def enter_feedback_score
    sliders = [overall_slider, technical_skills_slider, communication_slider, commercial_slider, leadership_slider]
    wait_present(overall_slider)
    sliders.each do |slide|
      rand(1..10).times do
        slide.send_keys :arrow_right
      end
    end
  end
end

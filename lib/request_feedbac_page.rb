require './lib/base_page'

class RequestFeedbackPage < BasePage

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

  def request_button
    @browser.button(visible_text: 'Request feedback')
  end

  def feedback_success_alert
    @browser.element(xpath: "//div[@class='modal ng-tns-c2-0 ng-star-inserted']")
  end

  def request_title
    @browser.element(xpath: "//div[@class='title']/h1")
  end

  def pending_request_title
    @browser.element(xpath: "//ul[@id='requestedFeedbackRequests']/li/div/h5/span")
  end

  def pending_requests
    @browser.lis(xpath: "//ul[@id='requestedFeedbackRequests']/li")
  end

  def pending_request_content
    @browser.divs(xpaht: "//ul[@id='requestedFeedbackRequests']/li/div")
  end

  def show_requests
    @browser.element(xpath: "//div[@class='action_link']/strong")
  end

  def provide_feedback_button
    @browser.button(xpath: "//button[contains(text(),'Provide feedback')]")
  end

  ##########################################################
  ##                    CLICK METHODS                     ##
  ##########################################################

  def request_feedback
    wait_present(request_button)
    request_button.click!
  end

  def open_requests
    wait_present(show_requests)
    show_requests.click!
  end

  def provide_feedback(requester)
    pending_requests.each do |request|
      if pending_request_title.text.include? requester
        provide_feedback_button.click!
      end
    end
  end


##########################################################
##                    CHECK METHODS                     ##
##########################################################

def check_title
  wait_present(request_title)
  if request_title.text.include? 'Request feedback'
    return true
  end
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
end

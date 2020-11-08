require './lib/base_page'

class TimeTrackingPage < BasePage

  ##########################################################
  ##                  LOCATOR METHODS                     ##
  ##########################################################

  def select_project_field
    @browser.select_list(name: 'project')
  end

  def select_project_fields
    @browser.select_lists(name: 'project')
  end

  def time_inputs_fields
    @browser.elements(xpath: "//div[@class='time-input input-group']/input")
  end

  def comment_inputs_fields
    @browser.elements(class: ['input-group-text', 'input-note-icon', 'icon-note'])
  end

  def delete_project_buttons
    @browser.elements(title: 'Remove project')
  end

  def add_more_button
    @browser.button(class: ['add-more-button'])
  end

  def save_time_logs_button
    @browser.button(text: 'Save Timesheet')
  end

  def submit_time_logs_button
    @browser.button(text: 'Save and submit for approval')
  end

  def unsubmit_time_log_button
    @browser.button(text: 'Unsubmit timesheet')
  end

  def comment_text_area
    @browser.textarea(id: 'comment-section')
  end

  def request_title
    @browser.element(xpath: "//div[@class='title']/h1")
  end

  def accept_comment_check
    @browser.element(class: ['icon-check'])
  end

  def confirm_deletion_button
    @browser.element(xpath: "//button[contains(text(),'Delete')]")
  end

  def pending_review_dropdown
    @browser.select_list(name: 'pendingReview')
  end

  def check_all_projects
    @browser.element(xpath: "//tr[contains(@class,'timetable-header')]/td/input")
  end

  def approve_entries_button
    @browser.button(text: 'Approve Entries')
  end

  def reject_entries_button
    @browser.button(text: 'Reject Entries')
  end

  def confirm_approval_button
    @browser.button(text: 'Approve')
  end

  def timelog_status
    @browser.element(class: ['status-top-5'])
  end

  ##########################################################
  ##                    CLICK METHODS                     ##
  ##########################################################

  def save_timelog
    wait_present(save_time_logs_button)
    save_time_logs_button.click!
  end

  def submit_timelog
    wait_present(submit_time_logs_button)
    submit_time_logs_button.click!
  end

  def unsubmit_timelog
    wait_present(unsubmit_time_log_button)
    unsubmit_time_log_button.click!
  end

  def remove_project(index)
    delete_project_buttons.each_with_index do |button, idx|
      if idx == index
        button.click!
        confirm_deletion_button.click!
      end
    end
  end

  def add_new_project
    wait_present(add_more_button)
    add_more_button.click!
  end

  def select_all_projects
    wait_present(check_all_projects)
    check_all_projects.click!
  end

  def approve_entries
    wait_present(approve_entries_button)
    approve_entries_button.click!
  end

  def reject_entries
    wait_present(reject_entries_button)
    reject_entries_button.click!
  end

  def confirm_approval
    wait_present(confirm_approval_button)
    confirm_approval_button.click!
  end

  ##########################################################
  ##                      SET METHODS                     ##
  ##########################################################

  def select_project(index=0, project)
    # select_project_fields.each_with_index do |field, idx|
    #   if idx == index
    #     field.select! project
    #   end
    # end
    select_project_fields[index].select project
  end

  def input_time
    time_inputs_fields.each do |field|
      field.to_subtype.clear
      field.send_keys rand(1..10)
    end
  end

  def input_comment(comment)
    comment_inputs_fields.each do |com|
      com.click!
      comment_text_area.send_keys comment.sample
      accept_comment_check.click!
    end
  end

  def select_timesheet_for_review(name)
    pending_review_dropdown.options.each do |option|
      puts option.text
      if option.text.include? name
        option.select
      end
    end
    #pending_review_dropdown.select name
  end

  ##########################################################
  ##                    CHECK METHODS                     ##
  ##########################################################

  def check_title
    wait_present(request_title)
    if request_title.text.include? 'Time Tracking'
      return true
    end
  end

  def check_status
    wait_present(timelog_status)
    if timelog_status.text == 'APPROVED'
      return true
    end
  end
end

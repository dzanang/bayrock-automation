require './lib/base_page'

class JobBoardPage < BasePage

  ##########################################################
  ##                  LOCATOR METHODS                     ##
  ##########################################################

  def add_new_job_button
    @browser.button(id: 'add-new-job')
  end

  def company_name
    @browser.text_field(id: 'companyName')
  end

  def company_info
    @browser.textarea(id: 'companyInfo')
  end

  def job_name
    @browser.text_field(id: 'jobName')
  end

  def job_type
    @browser.select_list(id: 'jobType')
  end

  def annual_salary_min
    @browser.text_field(id: 'annualSalaryEstimateMin')
  end

  def annual_salary_max
    @browser.text_field(id: 'annualSalaryEstimateMax')
  end

  def hourly_rate
    @browser.text_field(id: 'hourlyRate')
  end

  def start_date
    @browser.text_field(name: 'startDate')
  end

  def expected_end_date
    @browser.text_field(id: 'expectedEndDate')
  end

  def job_description
    @browser.textarea(id: 'jobDescription')
  end

  def city
    @browser.text_field(id: 'city')
  end

  def industry
    @browser.select_list(id: 'industry')
  end

  def candidate_profile
    @browser.textarea(id: 'candidateProfile')
  end

  def work_experience
    @browser.text_field(id: 'workExperience')
  end

  def tasks_description
    @browser.textarea(id: 'tasksDescription')
  end

  def skills
    @browser.text_field(id: 'skills')
  end

  def tasks
    @browser.text_field(id: 'tasks')
  end

  def add_tasks_button
    @browser.button(id: 'add-tasks')
  end

  def add_skills_button
    @browser.button(id: 'add-skill')
  end

  def publish_job_button
    @browser.button(id: 'publish-job')
  end

  def job_ads
    @browser.elements(class: ['job-item-title'])
  end

  def confirm_delete_button
    @browser.element(id: 'delete-job')
  end

  def job_filter_button
    @browser.button(xpath: "//button[contains(text(),'Filters')]")
  end

  def job_sort_button
    @browser.button(id: 'dropdownMenuButton')
  end

  def sort_filters
    @browser.as(xpath: '//a[@class="dropdown-item"]')
  end

  def filter_city
    @browser.text_field(name: 'city')
  end

  def filter_industry
    @browser.select_list(name: 'industry')
  end

  def filter_referral_fee
    @browser.text_field(name: 'referralFee')
  end

  def filter_job_type
    @browser.select_list(name: 'jobType')
  end

  def filter_rate
    @browser.text_field(name: 'hourlyRate')
  end

  def filter_salary
    @browser.text_field(name: 'annualSalary')
  end

  def clear_filters_button
    @browser.button(text: 'Clear filters')
  end

  def cancel_button
    @browser.button(text: 'Cancel')
  end

  def submit_filters_button
    @browser.button(text: 'Submit')
  end

  def search_field
    @browser.text_field(placeholder: 'Search for a job')
  end

  def delete_job_icon
    # @browser.element(xpath: "//job-post-item[1]//div[1]//div[1]//div[1]//div[2]//i[1]")
    @browser.element(xpath: "//div[@class='job-item-card-body']/div[@class='job-item-title-section']//i[1]")
  end

  def job_blue_strip
    @browser.element(class: 'job-item-referal-details')
  end

  def refer_now_button
    @browser.button(id: 'refer-now')
  end

  def apply_button
    @browser.button(id: 'apply-now')
  end

  def refer_user_email_field
    @browser.input(name: 'user')
  end

  def refer_user_phone_field
    @browser.input(id: 'phone')
  end

  def refer_user_upload_cv
    @browser.input(id: 'uploadcv')
  end

  def refer_user_reason_field
    @browser.textarea(id: 'candidateDescription')
  end

  def refer_user_tou
    @browser.checkbox(name: 'termsOfUse')
  end

  def refer_user_privacy_policy
    @browser.checkbox(id: 'privacyPolicy')
  end

  def refer_user_discussed
    @browser.checkbox(id: 'discussedPosition')
  end

  def send_application_button
    @browser.button(text: 'Send application')
  end

  def request_title
    @browser.element(xpath: "//div[@class='title']/h1")
  end

  def suggested_user
    @browser.element(xpath: "//button[@role='option']")
  end

  ##########################################################
  ##                    CHECK METHODS                     ##
  ##########################################################

  def check_publish_job_present?
    wait_present(publish_job_button)
    publish_job_button.present?
  end

  def check_add_new_job_button
    wait_present(add_new_job_button)
    add_new_job_button.present?
  end

  def check_title
    wait_present(request_title)
    if request_title.text.include? 'Job board'
      return true
    end
  end

  def check_automation_job_added(job_name)
    wait_present(job_ads)
    job_ads.each do |ad|
      if ad.inner_text.include? job_name
        return true
        break
        else
          return false
      end
    end
  end

  ##########################################################
  ##                    CLICK METHODS                     ##
  ##########################################################

  def click_publish_job
    wait_present(publish_job_button)
    publish_job_button.click!
  end

  def add_new_job
    wait_present(add_new_job_button)
    add_new_job_button.click!
  end

  def delete_job(name)
    wait_present(job_ads)
    job_ads.each do | ad |
      if ad.text.include? name
        puts ad.text
        delete_job_icon.click!
        wait_present(confirm_delete_button)
        confirm_delete_button.click
        wait_not_present(ad)
      end
    end
    # wait_present(delete_job_icon)
    # delete_job_icon.click!
    # wait_present(confirm_delete_button)
    # confirm_delete_button.click
  end

  def add_tasks
    wait_present(add_tasks_button)
    add_tasks_button.click!
  end

  def add_skills
    wait_present(add_skills_button)
    add_skills_button.click!
  end

  def send_application
    wait_present(send_application_button)
    send_application_button.click!
  end

  def apply_to_job
    wait_present(apply_button)
    apply_button.click!
  end

  def refer_to_job
    wait_present(refer_now_button)
    refer_now_button.click!
  end

  def open_job(title)
    automation_job = @browser.element(xpath: "//div[contains(text(),'#{title}')]")
    wait_present(automation_job)
    automation_job.click!
    # puts job_ads.length
    # job_ads.each do | ad |
    #   if ad.inner_text == title
    #     puts ad.text
    #     ad.click!
    #     break
    #   end
    # end
  end

  ##########################################################
  ##                      SET METHODS                     ##
  ##########################################################

  def enter_company_name(companyName)
    wait_present(company_name)
    company_name.set companyName
  end

  def enter_company_info(companyInfo)
    wait_present(company_info)
    company_info.set companyInfo
  end

  def enter_job_name(jobName)
    wait_present(job_name)
    job_name.set jobName
  end

  def select_job_type(jobType)
    wait_present(job_type)
    job_type.select jobType
  end

  def enter_salary_min(salaryMin)
    wait_present(annual_salary_min)
    annual_salary_min.set salaryMin
  end

  def enter_salary_max(salaryMax)
    wait_present(annual_salary_max)
    annual_salary_max.set salaryMax
  end

  def enter_hourly_rate(rate)
    wait_present(hourly_rate)
    hourly_rate.set rate
  end

  def enter_start_date(date)
    wait_present(start_date)
    start_date.set date
  end

  def enter_job_description(description)
    wait_present(job_description)
    job_description.set description
  end

  def enter_city(cityName)
    wait_present(city)
    city.set cityName
  end

  def select_industry(industryName)
    wait_present(industry)
    industry.select industryName
  end

  def enter_candidate_profile(profile)
    wait_present(candidate_profile)
    candidate_profile.set profile
  end

  def enter_work_experience(experience)
    wait_present(work_experience)
    work_experience.set experience
  end

  def enter_task_description(task_description)
    wait_present(tasks_description)
    tasks_description.set task_description
  end

  def enter_tasks(task_item)
    wait_present(tasks)
    task_item.each do |task|
      tasks.set task
      tasks.send_keys :enter
    end
  end

  def enter_skills(skill_item)
    wait_present(skills)
    skill_item.each do |skill|
      skills.set skill
      skills.send_keys :enter
    end
  end

  def enter_job_information(companyName, companyInfo, jobName, jobType, salaryMin, salaryMax, date, description, cityName, industryName, profile, experience, task_description, task_item, skill_item)
    enter_company_name companyName
    enter_company_info companyInfo
    enter_job_name jobName
    select_job_type jobType
    enter_salary_min salaryMin
    enter_salary_max salaryMax
    enter_start_date date
    enter_job_description description
    enter_city cityName
    select_industry industryName
    enter_candidate_profile profile
    enter_work_experience experience
    enter_task_description task_description
    enter_tasks task_item
    enter_skills skill_item
  end

  def search_job(job)
    wait_present(search_field)
    search_field.set job
    search_field.send_keys :enter
  end

  def enter_refer_email (email)
    #wait_present(refer_user_email_field)
    refer_user_email_field.send_keys email
    suggested_user.click!
  end

  def enter_refer_phone(phone)
    wait_present(refer_user_phone_field)
    refer_user_phone_field.send_keys phone
  end

  def upload_cv(cv)
    #wait_present(refer_user_upload_cv)
    refer_user_upload_cv.send_keys cv
  end

  def enter_reason(reason)
    #wait_present(refer_user_reason_field)
    refer_user_reason_field.send_keys reason
  end

  def accept_legals
    refer_user_tou.click!
    refer_user_privacy_policy.click!
    refer_user_discussed.click!
  end
end

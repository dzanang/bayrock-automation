shared_context 'New job creation' do
context 'Adding new job ad' do
  it 'Landed on Job Board' do
    navigation.click_menu_item 'board'
    expect(jobpage.check_title).to be true
  end

  it 'Clicked on the Add Job link' do
    jobpage.add_new_job
  end

  it 'Filled in the required fields' do
    jobpage.enter_job_information job['company_name'], job['company_info'], job['job_name'], job['job_type'], job['salary_min'], job['salary_max'],
    job['start_date'], job['job_description'], job['city'], job['industry'], job['candidate_profile'], job['work_experience'], job['tasks'], job['skills']
  end

  it 'Added new job ad' do
    jobpage.click_publish_job
    sleep 5
    expect(jobpage.check_automation_job_added(job['job_name'])).to be true
  end
end
end

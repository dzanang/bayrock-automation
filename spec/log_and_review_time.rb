require './spec_helper'

describe 'Attempting to log time for this week' do
  let(:user) { @user }
  let(:time) { @time }
  let(:login) { LoginPage.new(@browser) }
  let(:homepage) { HomePage.new(@browser) }
  let(:timetracking) { TimeTrackingPage.new(@browser) }
  let(:navigation) { NavigationPage.new(@browser) }


  context 'Successfully logged into Bayrock' do
    let(:email) { user['email']}
    let(:password) { user['password'] }
    include_context 'Login with user'
  end

  context 'Logging-in time' do
    it 'Landed on Time Tracking page' do
      navigation.click_menu_item 'tracking'
      expect(timetracking.check_title).to be true
    end

    it 'Entered time worked' do
      sleep 2
      timetracking.add_new_project
      timetracking.select_project 0, time['project_one']
      timetracking.select_project 1, time['project_one']
      timetracking.add_new_project
      timetracking.select_project 2, time['project_three']
      timetracking.input_time
      timetracking.input_comment time['comment']
      #timetracking.save_timelog
      timetracking.remove_project 1
      timetracking.select_project 0, time['project_two']
      timetracking.input_time
      timetracking.submit_timelog
      expect(homepage.check_alert_toast_present).to be true
      sleep 10
    end
  end

  context 'Logging into a Job Owner\'s account' do
    it 'Logged out of the app' do
      homepage.log_out
      expect(login.check_sign_in).to be true
    end
  end

  context 'Logged in with Job Owner\'s account into Bayrock' do
    let(:email) { user['email_alternative']}
    let(:password) { user['password'] }
    include_context 'Login with user'
  end

  context 'Reviewing submitted time logs' do
    it 'Landed on Time Tracking page' do
      navigation.click_menu_item 'tracking'
      expect(timetracking.check_title).to be true
    end

    it 'Approved time logs' do
      sleep 3
      timetracking.select_timesheet_for_review time['review']
      timetracking.select_all_projects
      timetracking.approve_entries
      timetracking.confirm_approval
      sleep 3
    end
  end

  context 'Logging into a Freelancer\'s account' do
    it 'Logged out of the app' do
      homepage.log_out
      expect(login.check_sign_in).to be true
    end
  end

  context 'Successfully logged into Bayrock' do
    let(:email) { user['email']}
    let(:password) { user['password'] }
    include_context 'Login with user'
  end

  context 'Checking if timesheets were successfully approved' do
    it 'Landed on Time Tracking page' do
      navigation.click_menu_item 'tracking'
      expect(timetracking.check_title).to be true
    end

    it 'Timesheets successfully approved' do
      expect(timetracking.check_status).to be true
    end
  end
end

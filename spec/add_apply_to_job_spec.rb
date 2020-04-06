cv = File.expand_path('../../assets/cv.docx', __FILE__)

describe 'Attempting to add new job ad' do
  let(:user) { @user }
  let(:job) { @job }
  let(:ref) { @referral }
  let(:login) { LoginPage.new(@browser) }
  let(:homepage) { HomePage.new(@browser) }
  let(:jobpage) { JobBoardPage.new(@browser) }
  let(:navigation) { NavigationPage.new(@browser) }
  let(:referrals) { MyReferralsPage.new(@browser) }

  context 'Successfully logged into Bayrock' do
    let(:email) { user['admin_email']}
    let(:password) { user['password'] }
    include_context 'Login with user'
  end

  context 'Creating new job ad' do
    include_context 'New job creation'
  end

  context 'Logging out' do
    it 'Logging out form Administrator account' do
      homepage.log_out
      expect(login.check_sign_in).to be true
    end
  end


  context 'Successfully logged into Bayrock as Freelancer' do
    let(:email) { user['email']}
    let(:password) { user['password'] }
    include_context 'Login with user'
  end

  context 'Starting the application process' do
    it 'Landed on Job Board' do
      navigation.click_menu_item 'board'
      expect(jobpage.check_title).to be true
    end

    it 'Referred a user to a job' do
      jobpage.open_job job['job_name']
      jobpage.refer_to_job
      jobpage.enter_refer_email user['refer_email']
      #jobpage.enter_refer_phone user['phone']
      jobpage.upload_cv cv
      jobpage.enter_reason job['reason']
      jobpage.accept_legals
      jobpage.send_application
      expect(homepage.check_alert_toast_present).to be true
    end
  end

  context 'Checking if the user has been added to My Referrals' do
    it 'Landed on My Referrals' do
      navigation.click_menu_item 'referrals'
      expect(referrals.check_title).to be true
    end

    it 'User successfully referred to a job' do
      expect(referrals.check_referral_present(ref['user'], ref['company'])).to be true
    end
  end

  context 'Logging out' do
    it 'Logging out form Freelancer account' do
      homepage.log_out
      expect(login.check_sign_in).to be true
    end
  end

  context 'Successfully logged into Bayrock as Administrator' do
    let(:email) { user['admin_email']}
    let(:password) { user['password'] }
    include_context 'Login with user'
  end

  context 'Opening Job Board page' do
    it 'Landed on Job Board' do
      navigation.click_menu_item 'board'
      expect(jobpage.check_title).to be true
    end
  end

  context 'Deleting the newly added job' do
    include_context 'Delete job'
  end
end

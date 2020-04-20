profile_photo = File.expand_path('../../assets/profile_photo.jpeg', __FILE__)
cv = File.expand_path('../../assets/cv.docx', __FILE__)

describe 'Changing user information' do
  let(:user) { @user }
  let(:member) { @member }
  let(:login) { LoginPage.new(@browser) }
  let(:homepage) { HomePage.new(@browser) }

  context 'Successfully logged into Bayrock' do
    let(:email) { user['email']}
    let(:password) { user['password'] }
    include_context 'Login with user'
  end

  context 'Changing user profile photo' do
    it 'New photo uploaded' do
      homepage.upload_new_profile_photo profile_photo
      sleep 2
      expect(homepage.check_alert_toast_present).to be true
    end
  end

  context 'Uploading and downloading user CV' do
    it 'New CV uploaded' do
      homepage.upload_new_cv cv
      expect(homepage.check_alert_toast_present).to be true
    end

    it 'CV downloaded' do
      homepage.download_cv
      expect(homepage.check_alert_toast_present).to be true
    end
  end
end

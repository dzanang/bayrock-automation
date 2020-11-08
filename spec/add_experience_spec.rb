describe 'Attempting to add new experience' do
  let(:user) { @user }
  let(:member) { @member }
  let(:exp) { @exp }
  let(:login) { LoginPage.new(@browser) }
  let(:homepage) { HomePage.new(@browser) }
  let(:experience) { AddExperiencePage.new(@browser) }

  context 'Successfully logged into Bayrock' do
    let(:email) { user['email']}
    let(:password) { user['password'] }
    include_context 'Login with user'
  end

  context 'Adding new experience' do
    include_context 'Add new experience'
  end

  context 'Deleting experience' do
    it 'Removed test experience' do
      homepage.delete_test_experience
      homepage.confirm_experience_deletion
      sleep 3
      expect(homepage.check_experience_added(exp['title'])).not_to be true #should be refactored in the future
    end
  end
end

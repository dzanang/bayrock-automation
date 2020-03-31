require './spec_helper'

describe 'Attempting to add new job ad' do
  let(:user) { @user }
  let(:job) { @job }
  let(:login) { LoginPage.new(@browser) }
  let(:homepage) { HomePage.new(@browser) }
  let(:jobpage) { JobBoardPage.new(@browser) }
  let(:navigation) { NavigationPage.new(@browser) }

  context 'Successfully logged into Bayrock' do
    let(:email) { user['email']}
    let(:password) { user['password'] }
    include_context 'Login with user'
  end

  context 'Testing searching, sorting and filtering jobs' do
    it 'Searched for a job' do
      jobpage.search_job ''
    end
  end
end

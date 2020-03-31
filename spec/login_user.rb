require './spec_helper'

describe 'Logging into Bayrock app' do
  let(:user) { @user }
  let(:member) { @member }
  let(:login) { LoginPage.new(@browser) }
  let(:homepage) { HomePage.new(@browser) }

  context 'Successfully logged into Bayrock' do
    let(:email) { user['email']}
    let(:password) { user['password'] }
    include_context 'Login with user'
  end
end

describe 'Registering Bayrock account' do
  let(:user) { @user }
  let(:member) { @member }
  let(:login) { LoginPage.new(@browser) }
  let(:register) { RegisterPage.new(@browser)}
  let(:homepage) { HomePage.new(@browser) }

  context 'Account Registration' do
    include_context 'Register new account'
  end
end

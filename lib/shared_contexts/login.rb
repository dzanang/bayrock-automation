shared_context 'Login with user' do
  context 'Enter login information and submit' do
    it 'User logging in' do
      login.enter_username email
      login.enter_password password
      login.click_sign_in
    end

    it 'Verified user is logged in' do
      expect(homepage.check_logout_button).to be true
    end
  end
end

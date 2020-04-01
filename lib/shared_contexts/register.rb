shared_context 'Register new account' do
  context 'Attempting creation of new Bayrock account' do
    it "Entered neccessary information for new Bayrock account" do
      login.click_signup
      register.enter_name user['first_name']
      register.enter_lastname user['last_name']
      register.enter_email rand(2**256).to_s(36)[0..5] + '@bayrock.nl'
      register.enter_password user['password']
      register.enter_matching_password user['password']
      register.accept_terms
    end

    it 'Confirmed password validity' do
      expect(register.check_password_validity).to be true
    end

    it 'Registered new Bayrock account' do
      register.click_sign_up
      sleep 5
    end
  end
end

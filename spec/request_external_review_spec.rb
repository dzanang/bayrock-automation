describe 'Attempting to request new external reference' do
  let(:user) { @user }
  let(:ext) { @external }
  let(:exp) { @exp }
  let(:login) { LoginPage.new(@browser) }
  let(:homepage) { HomePage.new(@browser) }
  let(:reference) { ExternalReferencePage.new(@browser) }
  let(:experience) { AddExperiencePage.new(@browser) }

  context 'Successfully logged into Bayrock' do
    let(:email) { user['email']}
    let(:password) { user['password'] }
    include_context 'Login with user'
  end

  context 'Adding new experience' do
    include_context 'Add new experience'
  end

  context 'Requesting new external reference' do
    it 'Opened reference modal' do
      homepage.request_external_reference
      expect(reference.check_modal_opened).to be true
    end

    it 'Completed the form' do
      reference.enter_reviewer_information ext['name'], ext['last_name'], ext['email'], ext['phone'], ext['position'], ext['project']
      reference.send_review_request
      expect(homepage.check_alert_toast_present).to be true
    end
  end
end

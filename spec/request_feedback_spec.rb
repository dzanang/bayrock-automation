describe 'Requesting new feedback' do
  let(:user) { @user }
  let(:feedback) { @feedback }
  let(:login) { LoginPage.new(@browser) }
  let(:navigation) { NavigationPage.new(@browser) }
  let(:request) { RequestFeedbackPage.new(@browser) }
  let(:provide) { ProvideFeedbackPage.new(@browser) }
  let(:homepage) { HomePage.new(@browser) }
  let(:myfeedback) { MyFeedbackPage.new(@browser) }

  context 'Successfully logged into Bayrock' do
    let(:email) { user['email']}
    let(:password) { user['password'] }
    include_context 'Login with user'
  end

  context 'Requesting feedback from reviewer' do
    it 'Landed on Request Feedback page' do
      navigation.click_menu_item 'Request'
      expect(request.check_title).to be true
    end

    it 'Filled in neccessary information' do
      request.select_project_list feedback['project_request']
      sleep 3
      request.select_person_list feedback['person_request']
      request.enter_worked_from feedback['worked_from']
      request.enter_worked_until feedback['worked_to']
      request.enter_hours feedback['hours_worked']
      request.request_feedback
    end

    it 'Feedback successfuly requested' do
      expect(request.check_success).to be true
      sleep 5
    end
  end

  context 'Responding to feedback request' do
    it 'Logged out of the app' do
      homepage.log_out
      expect(login.check_sign_in).to be true
    end

    context 'Logged in with Reviewer account into Bayrock' do
      let(:email) { user['email_alternative']}
      let(:password) { user['password'] }
      include_context 'Login with user'
    end

    context 'Providing feedback on request' do
      it 'Opened feedback requests' do
        request.open_requests
      end

      it 'Provided feedback' do
        request.provide_feedback 'Freelancer'
        sleep 2
        provide.enter_private_comment feedback['private_comment']
        provide.enter_public_comment feedback['public_comment']
        provide.enter_feedback_score
        provide.enter_work_again feedback['work_again']
        provide.send_feedback
        provide.confirm_send_feedback
      end

      it 'Feedback successfuly sent' do
        expect(provide.check_success).to be true
      end
    end
  end

  context 'Checking if feedback was properly received' do
    it 'Logged out of the app' do
      homepage.log_out
      expect(login.check_sign_in).to be true
    end

    context 'Logged in with Freelancers account into Bayrock' do
      let(:email) { user['email']}
      let(:password) { user['password'] }
      include_context 'Login with user'
    end

    context 'Checking My Feedback' do
      it 'Opened My Feedback page' do
        navigation.click_menu_item 'My feedback'
        expect(myfeedback.check_title).to be true
      end

      it 'Feedback properly displayed on My Feedback' do
        expect(myfeedback.check_feedback_present(feedback['feedback_name'])).to be true
        sleep 5
      end
    end
  end
end

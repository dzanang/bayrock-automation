require './spec_helper'

describe 'Providing new feedback' do
  let(:user) { @user }
  let(:feedback) { @feedback }
  let(:login) { LoginPage.new(@browser) }
  let(:navigation) { NavigationPage.new(@browser) }
  let(:provide) { ProvideFeedbackPage.new(@browser) }
  let(:homepage) { HomePage.new(@browser) }

  context 'Successfully logged into Bayrock' do
    let(:email) { user['email_alternative']}
    let(:password) { user['password'] }
    include_context 'Login with user'
  end

  context 'Providing user feedback' do
    it 'Landed on Provide Feedback page' do
      navigation.click_menu_item 'Provide'
      expect(provide.check_public_comments).to be true
    end

    it 'Filled in neccessary information' do
      provide.select_project_list feedback['project_provide']
      sleep 3
      provide.select_person_list feedback['person_provide']
      provide.enter_worked_from feedback['worked_from']
      provide.enter_worked_until feedback['worked_to']
      provide.enter_hours feedback['hours_worked']
      provide.enter_private_comment feedback['private_comment']
      provide.enter_public_comment feedback['public_comment']
      provide.enter_feedback_score
      provide.enter_work_again feedback['work_again']
      provide.send_feedback
      provide.confirm_send_feedback
    end

    it 'Feedback successfuly sent' do
      expect(provide.check_success).to be true
      sleep 5
    end
  end
end

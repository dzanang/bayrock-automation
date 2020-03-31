require './spec_helper'

describe 'Attempting to add new education' do
  let(:user) { @user }
  let(:edu) { @education }
  let(:login) { LoginPage.new(@browser) }
  let(:homepage) { HomePage.new(@browser) }
  let(:education) { AddEducationPage.new(@browser) }

  context 'Successfully logged into Bayrock' do
    let(:email) { user['email']}
    let(:password) { user['password'] }
    include_context 'Login with user'
  end

  context 'Adding new education' do
    it 'Opened education modal' do
      homepage.add_new_education
      expect(education.check_education_sb_present?).to be true
    end

    it 'Filled in the necessary data' do
      education.enter_school edu['school']
      education.enter_degree edu['degree']
      education.enter_field_of_study edu['field_of_study']
      education.enter_from_year edu['from_year']
      education.enter_to_year edu['to_year']
      education.enter_education_description edu['description']
    end

    it 'Added new education' do
      education.click_education_save_button
      sleep 5
      expect(homepage.check_education_added(edu['school'])).to be true
    end

    it 'Edit newly added education' do
      homepage.edit_education
      education.enter_school edu['edit_school']
      education.click_education_save_button
      sleep 5
      expect(homepage.check_education_title).to include edu['edit_school']
    end

    it 'Removed test education' do
      homepage.delete_test_education
      sleep 5
      expect(homepage.check_education_added(edu['school'])).not_to be true
    end
  end
end

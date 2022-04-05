require 'rails_helper'

RSpec.feature 'Save and Return', js: true do

  let(:emails_sent) do
    ET3::Test::EmailsSent.new
  end

  scenario 'Correctly will enable the user to register' do
    given_valid_user
    start_a_new_et3_response
    registration_start

    expect(respondents_details_page).to be_displayed
  end

  scenario 'Incorrectly will provide error on user to sign up' do
    start_a_new_et3_response
    registration_page.next

    registration_page.memorable_word_question.assert_error_message(t 'errors.custom.memorable_word')
  end

  scenario 'Correctly will log out user and have a new empty session' do
    given_valid_user
    start_page.load(locale: current_locale_parameter)
    given_valid_data
    start_a_new_et3_response
    registration_start
    answer_respondents_details
    page.reset_session!
    start_a_new_et3_response

    expect(registration_page.email_question.value).to eql ""
    expect(registration_page.memorable_word_question.value). to eql ""
  end

  scenario 'user will receive an email once registration done' do
    given_valid_user
    start_a_new_et3_response
    registration_start

    expect(respondents_details_page).to be_displayed

    email_sent = emails_sent.new_reference_number_html_email_for(reference: @save_and_return_number)
    expect(email_sent).to be_present
  end

  scenario 'Click on reset password will bring you to password page' do
    start_page.load(locale: current_locale_parameter)
    start_page.return_to_response
    session_page.reset_password

    expect(password_page).to be_displayed
  end

  scenario 'Incorrectly will provide error on user to reset password' do
    start_page.load(locale: current_locale_parameter)
    start_page.return_to_response
    session_page.reset_password
    password_page.next

    expect(password_page.email_address_question).to have_error_password_email_address
  end

  scenario 'Will enable an existing user to sign in', js: false do
    given_valid_user
    start_a_new_et3_response
    registration_start
    respondents_details_page.save_and_complete_later
    start_page.return_to_response
    sign_in
    expect(respondents_details_page).to have_header(wait: 30)
  end
end

require 'rails_helper'

RSpec.feature "Access Form Submission Page", js: true do

  before do
    stub_et_api
    stub_build_blob_to_azure
  end

  scenario "user will be able to read text" do
    given_valid_user
    given_valid_data
    start_a_new_et3_response
    registration_start
    answer_respondents_details
    answer_claimants_details
    answer_earnings_and_benefits
    answer_defend_claim_question
    answer_representative
    answer_disability_question
    answer_employers_contract_claim
    answer_additional_information
    answer_confirmation_of_supplied_details

    expect(form_submission_page).to be_displayed
    expect(form_submission_page).to have_submission_confirmation
    expect(form_submission_page).to have_reference_number
    expect(form_submission_page).to have_office_contact
    expect(form_submission_page).to have_submission_date
    expect(form_submission_page).to have_copy_sent
    expect(form_submission_page).to have_valid_pdf_download
    expect(form_submission_page.submission_date).to have_text(I18n.l(Date.parse('13 January 2018'), format: :pretty, locale: ET3::Test::Messaging.instance.current_locale))
  end

  scenario 'user without email address' do
    given_valid_user
    given_valid_data
    @respondent = FactoryBot.create(:respondent, :respondent_valid, :upload_additional_information, :contact_preference_post)
    start_a_new_et3_response
    registration_start
    answer_respondents_details
    answer_claimants_details
    answer_earnings_and_benefits
    answer_defend_claim_question
    answer_representative
    answer_disability_question
    answer_employers_contract_claim
    answer_additional_information
    answer_confirmation_of_supplied_details

    expect(form_submission_page.assert_copy_sent(@respondent))
  end

  scenario 'user with email address' do
    given_valid_user
    given_valid_data
    start_a_new_et3_response
    registration_start
    answer_respondents_details
    answer_claimants_details
    answer_earnings_and_benefits
    answer_defend_claim_question
    answer_representative
    answer_disability_question
    answer_employers_contract_claim
    answer_additional_information
    answer_confirmation_of_supplied_details

    expect(form_submission_page.assert_copy_sent(@respondent))
  end

end

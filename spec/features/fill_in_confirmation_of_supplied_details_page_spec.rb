require 'rails_helper'
RSpec.feature "Fill in Confirmation of Supplied Details Page", js: true do
  let(:form_submission_page) { ET3::Test::FormSubmissionPage.new }

  before do
    stub_et_api
    stub_presigned_url_api_for_s3
  end

  scenario "correctly will enable user to continue to next page" do
    given_valid_data
    start_a_new_et3_response
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
  end

  scenario "incorrectly will provide errors" do
    @claimant = FactoryBot.create(:claimant, :claimant_valid)
    @respondent = FactoryBot.create(:respondent, :respondent_valid, :upload_additional_information, email_receipt: 'invalid.email')
    @representative = FactoryBot.create(:representative, :representative_valid)

    start_a_new_et3_response
    answer_respondents_details
    answer_claimants_details
    answer_earnings_and_benefits
    answer_defend_claim_question
    answer_representative
    answer_disability_question
    answer_employers_contract_claim
    answer_additional_information
    answer_confirmation_of_supplied_details

    expect(confirmation_of_supplied_details_page).to have_error_header
    expect(confirmation_of_supplied_details_page.email_receipt_question).to have_error_invalid_email
  end
end

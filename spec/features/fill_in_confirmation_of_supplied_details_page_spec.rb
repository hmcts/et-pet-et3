require 'rails_helper'
RSpec.feature "Fill in Confirmation of Supplied Details Page", :js do
  let(:form_submission_page) { ET3::Test::FormSubmissionPage.new }
  include ActiveJob::TestHelper

  before do
    stub_et_api
    stub_create_blob_to_azure
  end

  scenario "correctly will enable user to continue to next page" do
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
  end

  scenario "incorrectly will provide errors" do
    given_valid_user
    @claimant = FactoryBot.create(:claimant, :claimant_valid)
    @respondent = FactoryBot.create(:respondent, :respondent_valid, :upload_additional_information, email_receipt: 'invalid.email')
    @representative = FactoryBot.create(:representative, :representative_valid)

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
    answer_confirmation_of_supplied_details(expect_errors: true)

    expect(confirmation_of_supplied_details_page).to have_error_header
    confirmation_of_supplied_details_page.email_receipt_question.assert_error_message(t('errors.messages.invalid_email'))
  end

  scenario "an error 500 cause a please wait page and schedule a job" do
    stub = stub_request(:post, "#{ENV.fetch('ET_API_URL', 'http://api.et.127.0.0.1.nip.io:3100/api/v2')}/respondents/build_response").
      with(headers: { 'Content-Type': 'application/json', Accept: 'application/json' }).
      to_return(
        headers: { 'Content-Type': 'application/json' },
        body:
          {
            error: 'Gateway timeout'
          }.to_json,
        status: 502
      )
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
    answer_confirmation_of_supplied_details(expect_errors: true)

    expect(submission_in_progress_page).to be_displayed
    expect(SubmitToApiJob).to have_been_enqueued.with(an_instance_of(Store)).at_least(:once)

    remove_request_stub(stub)

    perform_enqueued_jobs only: SubmitToApiJob
    expect(form_submission_page).to be_displayed
  end

end

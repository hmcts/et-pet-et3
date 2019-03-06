require 'rails_helper'

RSpec.feature "Access Form Submission Page", js: true do

  before do
    stub_et_api
    stub_build_blob_to_s3
  end

  scenario "user will be able to read text" do
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
    expect(form_submission_page).to have_submission_confirmation
    expect(form_submission_page).to have_reference_number
    expect(form_submission_page).to have_thank_you
    expect(form_submission_page).to have_office_contact
    expect(form_submission_page).to have_submission_date
    expect(form_submission_page).to have_valid_pdf_download
  end

  scenario "user can navigate to the gov.uk homepage" do
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

    form_submission_page.return

    expect(current_url).to eql 'https://www.gov.uk/'
  end

end

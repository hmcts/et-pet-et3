require 'rails_helper'
RSpec.feature "Submit invalid office code", js: true do

  before do
    stub_submission_invalid_office
  end

  scenario "shows the user an error page" do
    given_valid_data
    @respondent = FactoryBot.create(:respondent, :respondent_valid, case_number: '0254321/2018')

    respondents_details_page.load
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

    expect(respondents_details_page).to be_displayed
    expect(respondents_details_page.case_number_question).to have_error_office_invalid
  end

end

require 'rails_helper'
RSpec.feature "Fill in Employers Contract Claim Page", js: true do
  let(:additional_information_page) { ET3::Test::AdditionalInformationPage.new }

  scenario "correctly will enable user to continue to next page" do
    employers_contract_claim_page.load(locale: current_locale_parameter)
    given_valid_data
    answer_employers_contract_claim

    expect(additional_information_page).to be_displayed
  end

  scenario "incorrectly will provide errors" do
    employers_contract_claim_page.load(locale: current_locale_parameter)
    given_invalid_data
    answer_employers_contract_claim

    expect(employers_contract_claim_page).to have_error_header
    expect(employers_contract_claim_page.make_employer_contract_claim_question).to have_error_too_long
  end

  scenario "correctly will enable user to check answers and return to edit them" do
    employers_contract_claim_page.load(locale: current_locale_parameter)
    given_valid_data
    answer_employers_contract_claim

    confirmation_of_supplied_details_page.load(locale: current_locale_parameter)
    confirmation_of_supplied_details_page.confirmation_of_employer_contract_claim_answers.edit_page_link.click

    expect(employers_contract_claim_page).to be_displayed
    employers_contract_claim_page.make_employer_contract_claim_question.assert_answers_for(@respondent)
  end
end

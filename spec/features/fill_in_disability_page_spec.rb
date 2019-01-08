require 'rails_helper'
RSpec.feature "Fill in Disability Page", js: true do
  let(:employers_contract_claim_page) { ET3::Test::EmployersContractClaimPage.new }

  scenario "correctly will enable user to continue to employer's contract claim page" do
    disability_page.load(locale: current_locale_parameter)
    given_valid_data
    answer_disability_question

    expect(employers_contract_claim_page).to be_displayed
  end

  scenario "incorrectly will provide errors" do
    disability_page.load(locale: current_locale_parameter)
    given_invalid_data
    answer_disability_question

    expect(disability_page).to have_error_header
    expect(disability_page.disability_question).to have_error_too_long
  end

  scenario "correctly will enable user to check answers and return to edit them" do
    disability_page.load(locale: current_locale_parameter)
    given_valid_data
    answer_disability_question

    confirmation_of_supplied_details_page.load(locale: current_locale_parameter)
    confirmation_of_supplied_details_page.confirmation_of_disability_answers.edit_page_link.click

    expect(disability_page).to be_displayed
    disability_page.disability_question.assert_answers_for(@respondent)
  end
end

require 'rails_helper'
RSpec.feature "Fill in Response Page", js: true do
  let(:your_representative_page) { ET3::Test::YourRepresentativePage.new }

  scenario "correctly will enable user to continue to next page" do
    response_page.load(locale: current_locale_parameter)
    given_valid_data
    answer_defend_claim_question

    expect(your_representative_page).to be_displayed
  end

  scenario "incorrectly will provide errors" do
    response_page.load(locale: current_locale_parameter)
    given_invalid_data
    answer_defend_claim_question

    expect(response_page).to have_error_header
    expect(response_page.defend_claim_question).to have_error_too_long
  end

  scenario "correctly will enable user to check answers and return to edit them" do
    response_page.load(locale: current_locale_parameter)
    given_valid_data
    answer_defend_claim_question

    confirmation_of_supplied_details_page.load(locale: current_locale_parameter)
    confirmation_of_supplied_details_page.confirmation_of_response_answers.edit_page_link.click

    expect(response_page).to be_displayed
    response_page.defend_claim_question.assert_answers_for(@claimant)
  end
end

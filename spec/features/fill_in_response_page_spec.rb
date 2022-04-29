require 'rails_helper'
RSpec.feature "Fill in Response Page", js: true do
  let(:your_representative_page) { ET3::Test::YourRepresentativePage.new }

  before do
    given_valid_user
    start_a_new_et3_response
    registration_start
  end

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
    response_page.defend_claim_facts.assert_error_message(t('errors.messages.too_long'))
  end

  scenario "correctly will enable user to check answers and return to edit them" do
    response_page.load(locale: current_locale_parameter)
    given_valid_data
    answer_defend_claim_question

    confirmation_of_supplied_details_page.load(locale: current_locale_parameter)
    confirmation_of_supplied_details_page.confirmation_of_response_answers.edit_response_page_link.click

    expect(response_page).to be_displayed
    expect(response_page.defend_claim_question.value).to eql(t(@claimant.defend_claim))
    if @claimant.defend_claim.to_s.split('.').last == 'yes'
      expect(response_page.defend_claim_facts.value).to eql @claimant.defend_claim_facts
    end
  end
end

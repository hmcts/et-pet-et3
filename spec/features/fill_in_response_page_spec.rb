require 'rails_helper'
RSpec.feature "Fill in Respondents Details Page", js: true do
  let(:your_representative_page) { ET3::Test::YourRepresentativePage.new }

  scenario "correctly will enable user to continue to next page" do
    response_page.load(locale: current_locale_parameter)

    given_i_am(:company01)

    answer_defend_claim_question

    response_page.next

    expect(your_representative_page).to be_displayed
  end

  scenario "incorrectly will provide errors" do
    response_page.load(locale: current_locale_parameter)

    given_i_am(:erroneously_entering_data)

    answer_defend_claim_question

    response_page.next

    expect(response_page).to have_error_header
    expect(response_page.defend_claim_question).to have_error_too_long
  end

  scenario "correctly will enable user to check answers and return to edit them" do
    response_page.load(locale: current_locale_parameter)

    given_i_am(:company01)

    answer_defend_claim_question

    response_page.next
    confirmation_of_supplied_details_path.load(locale: current_locale_parameter)
    confirmation_of_supplied_details_page.confirmation_of_response_answers.edit_page_link.click

    expect(response_page).to be_displayed
    expect(response_page.defend_claim_question.get).to eql user.defend_claim
    expect(response_page.defend_claim_question.defend_claim_facts.root_element.value).to eql user.defend_claim_facts if user.defend_claim == "Yes"
  end
end

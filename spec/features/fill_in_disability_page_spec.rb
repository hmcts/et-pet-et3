require 'rails_helper'
RSpec.feature "Fill in Disability Page", js: true do
  let(:employers_contract_claim_page) { ET3::Test::EmployersContractClaimPage.new }

  scenario "correctly will enable user to continue to employer's contract claim page" do
    disability_page.load

    given_i_am(:company01)

    answer_disability_question

    disability_page.next

    expect(employers_contract_claim_page).to be_displayed
  end

  scenario "incorrectly will provide errors" do
    disability_page.load

    given_i_am(:erroneously_entering_data)

    answer_disability_question

    disability_page.next

    expect(disability_page).to have_error_header
    expect(disability_page.disability_question).to have_error_too_long
  end

  scenario "correctly will enable user to check answers and return to edit them" do
    disability_page.load

    given_i_am(:company01)

    answer_disability_question

    disability_page.next
    visit confirmation_of_supplied_details_path
    confirmation_of_supplied_details_page.confirmation_of_disability_answers.edit_page_link.click

    expect(disability_page).to be_displayed
    expect(disability_page.disability_question.get).to eql user.disability
    expect(disability_page.disability_question.disability_information.root_element.value).to eql user.disability_information if user.disability == 'Yes'
  end
end

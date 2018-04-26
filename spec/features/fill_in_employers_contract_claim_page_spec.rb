require 'rails_helper'
RSpec.feature "Fill in Employers Contract Claim Page", js: true do
  let(:confirmation_of_supplied_details_page) { ET3::Test::ConfirmationOfSuppliedDetailsPage.new }

  scenario "correctly will enable user to continue to next page" do
    given_i_am(:company01)

    answer_all_to_employers_contract_claim
    employers_contract_claim_page.next

    expect(confirmation_of_supplied_details_page).to be_displayed
  end

  scenario "incorrectly will provide errors" do
    given_i_am(:erroneously_entering_data_on_employers_contract_claim_page)
    answer_all_to_employers_contract_claim
    employers_contract_claim_page.next

    expect(employers_contract_claim_page).to have_error_header
    expect(employers_contract_claim_page.make_employer_contract_claim_question).to have_error_too_long
  end
end

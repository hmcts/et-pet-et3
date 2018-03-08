require 'rails_helper'
RSpec.feature "Fill in Employers Contract Claim Page", js: true do
  let(:confirmation_of_supplied_details_page) { ET3::Test::ConfirmationOfSuppliedDetailsPage.new }

  scenario "correctly will enable user to continue to next page" do
    employers_contract_claim_page.load

    given_i_am(:company01)

    answer_make_employer_contract_claim_question
    upload_additional_information

    employers_contract_claim_page.next

    expect(confirmation_of_supplied_details_page).to be_displayed
  end
end

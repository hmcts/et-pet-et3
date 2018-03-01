require 'rails_helper'
RSpec.feature "Fill in Your Representative Page", js: true do
  let(:your_representatives_details_page) { ET3::Test::YourRepresentativesDetailsPage.new }
  let(:employers_contract_claim_page) { ET3::Test::EmployersContractClaimPage.new }

  scenario "correctly will enable user to continue to representative details page" do
    your_representative_page.load

    given_i_am(:company01)

    answer_have_representative_question

    your_representative_page.next

    expect(your_representatives_details_page).to be_displayed
  end

  scenario "correctly will enable user to continue to employer's contract claim page" do
    your_representative_page.load

    given_i_am(:company02)

    answer_have_representative_question

    your_representative_page.next

    expect(employers_contract_claim_page).to be_displayed
  end
end

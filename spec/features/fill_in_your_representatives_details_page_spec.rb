require 'rails_helper'
RSpec.feature "Fill in Respondents Details Page", js: true do
  let(:employers_contract_claim) { ET3::Test::EmployersContractClaimPage.new }

  scenario "correctly will enable user to continue to next page" do
    your_representatives_details_page.load

    given_i_am(:company01)

    answer_type_of_representative_question
    answer_representative_org_name_question
    answer_representative_name_question
    answer_representative_building_question
    answer_representative_street_question
    answer_representative_town_question
    answer_representative_county_question
    answer_representative_postcode_question
    answer_representative_phone_question
    answer_representative_mobile_question
    answer_representative_dx_number_question
    answer_representative_reference_question
    answer_representative_contact_preference_question
    answer_representative_disability_question

    your_representatives_details_page.next

    expect(employers_contract_claim_page).to be_displayed
  end
end

require 'rails_helper'
RSpec.feature "Fill in Your Representatives Details Page", js: true do
  let(:employers_contract_claim_page) { ET3::Test::EmployersContractClaimPage.new }

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

  scenario "incorrectly will provide errors" do
    your_representatives_details_page.load

    given_i_am(:erroneously_entering_data)

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

    expect(your_representatives_details_page).to have_error_header
    expect(your_representatives_details_page.type_of_representative_question).to have_error_inclusion
    expect(your_representatives_details_page.representative_name_question).to have_error_contains_numbers
    expect(your_representatives_details_page.representative_building_question).to have_error_blank
    expect(your_representatives_details_page.representative_street_question).to have_error_blank
    expect(your_representatives_details_page.representative_town_question).to have_error_blank
    expect(your_representatives_details_page.representative_postcode_question).to have_error_invalid
    expect(your_representatives_details_page.representative_phone_question).to have_error_invalid
    expect(your_representatives_details_page.representative_mobile_question).to have_error_invalid
    expect(your_representatives_details_page.representative_contact_preference_question).to have_error_invalid
    expect(your_representatives_details_page.representative_disability_question).to have_error_too_long
  end
end

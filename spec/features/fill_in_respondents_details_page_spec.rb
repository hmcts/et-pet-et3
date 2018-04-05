require 'rails_helper'
RSpec.feature "Fill in Respondents Details Page", js: true do
  let(:claimants_details_page) { ET3::Test::ClaimantsDetailsPage.new }

  scenario "correctly will enable user to continue to next page" do
    respondents_details_page.load

    given_i_am(:company01)

    answer_case_number_question
    answer_name_question
    answer_contact_question
    answer_building_name_question
    answer_street_question
    answer_town_question
    answer_postcode_question
    answer_contact_preference_question
    answer_organisation_more_than_one_site_question

    respondents_details_page.next

    expect(claimants_details_page).to be_displayed
  end

  scenario "incorrectly will provide many errors" do
    respondents_details_page.load

    given_i_am(:erroneously_entering_data)

    answer_case_number_question
    answer_name_question
    answer_contact_question
    answer_building_name_question
    answer_street_question
    answer_town_question
    answer_county_question
    answer_postcode_question
    answer_dx_number_question
    answer_contact_number_question
    answer_contact_mobile_number_question
    answer_contact_preference_question
    answer_organisation_employ_gb_question
    answer_organisation_more_than_one_site_question

    respondents_details_page.next

    expect(respondents_details_page).to have_error_header
    expect(respondents_details_page.case_number_question).to have_error_invalid
    expect(respondents_details_page.name_question).to have_error_blank
    expect(respondents_details_page.contact_question).to have_error_contains_numbers
    expect(respondents_details_page.building_name_question).to have_error_blank
    expect(respondents_details_page.street_question).to have_error_blank
    expect(respondents_details_page.town_question).to have_error_blank
    expect(respondents_details_page.postcode_question).to have_error_invalid
    # TODO: RST-1033
    # expect(respondents_details_page.dx_number_question).to have_error_invalid
    expect(respondents_details_page.contact_preference_question).to have_error_invalid_fax
    expect(respondents_details_page.organisation_employ_gb_question).to have_error_not_a_number
    expect(respondents_details_page.organisation_more_than_one_site_question).to have_error_not_a_number
  end
end

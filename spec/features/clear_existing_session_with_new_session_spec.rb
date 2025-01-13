require 'rails_helper'
RSpec.feature "Clear existing session with new session", :js do

  scenario "works when clicking the 'Start now' button" do
    given_valid_user
    start_page.load(locale: current_locale_parameter)
    given_valid_data
    start_a_new_et3_response
    registration_start
    answer_respondents_details
    page.reset_session!
    start_a_new_et3_response
    registration_start

    expect(respondents_details_page.case_number_question.value).to eql ""
    expect(respondents_details_page.name_question.value).to eql ""
    expect(respondents_details_page.company_number_question.value).to eql ""
    expect(respondents_details_page.contact_question.value).to eql ""
    expect(respondents_details_page.building_name_question.value).to eql ""
    expect(respondents_details_page.street_question.value).to eql ""
    expect(respondents_details_page.town_question.value).to eql ""
    expect(respondents_details_page.county_question.value).to eql ""
    expect(respondents_details_page.postcode_question.value).to eql ""
    expect(respondents_details_page.dx_number_question.value).to eql ""
    expect(respondents_details_page.contact_number_question.value).to eql ""
    expect(respondents_details_page.contact_mobile_number_question.value).to eql ""
    expect(respondents_details_page.contact_preference_question.value).to be_nil
    expect(respondents_details_page.organisation_employ_gb_question.value).to eql ""
    expect(respondents_details_page.organisation_more_than_one_site_question.value).to be_nil
    expect(respondents_details_page).not_to have_employment_at_site_number_question
  end
end

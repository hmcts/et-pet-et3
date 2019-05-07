require 'rails_helper'
RSpec.feature "Clear existing session with new session", js: true do

  scenario "works when clicking the 'Start now' button" do
    start_page.load(locale: current_locale_parameter)
    given_valid_data
    start_a_new_et3_response
    answer_respondents_details
    start_a_new_et3_response

    expect(respondents_details_page.case_number_question.field.value).to eql ""
    expect(respondents_details_page.name_question.field.value).to eql ""
    expect(respondents_details_page.contact_question.field.value).to eql ""
    expect(respondents_details_page.building_name_question.field.value).to eql ""
    expect(respondents_details_page.street_question.field.value).to eql ""
    expect(respondents_details_page.town_question.field.value).to eql ""
    expect(respondents_details_page.county_question.field.value).to eql ""
    expect(respondents_details_page.postcode_question.field.value).to eql ""
    expect(respondents_details_page.dx_number_question.field.value).to eql ""
    expect(respondents_details_page.contact_number_question.field.value).to eql ""
    expect(respondents_details_page.contact_mobile_number_question.field.value).to eql ""
    respondents_details_page.contact_preference_question.email.assert_selector(:field, nil, checked: false)
    expect(respondents_details_page.contact_preference_question.preference_email.value).to eql ""
    respondents_details_page.contact_preference_question.post.assert_selector(:field, nil, checked: false)
    respondents_details_page.contact_preference_question.fax.assert_selector(:field, nil, checked: false)
    expect(respondents_details_page.contact_preference_question.preference_fax.value).to eql ""
    expect(respondents_details_page.organisation_employ_gb_question.field.value).to eql ""
    respondents_details_page.organisation_more_than_one_site_question.assert_selector(:field, nil, checked: false)
    expect(respondents_details_page.organisation_more_than_one_site_question.employment_at_site_number.value).to eql ""
  end

end

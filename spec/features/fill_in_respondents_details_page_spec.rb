require 'rails_helper'
RSpec.feature "Fill in Respondents Details Page", js: true do
  let(:claimants_details_page) { ET3::Test::ClaimantsDetailsPage.new }

  scenario "correctly will enable user to continue to next page" do
    respondents_details_page.load(locale: current_locale_parameter)

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
    respondents_details_page.load(locale: current_locale_parameter)

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
    expect(respondents_details_page.postcode_question).to have_error_invalid_postcode
    expect(respondents_details_page.contact_preference_question).to have_error_invalid_fax
    expect(respondents_details_page.organisation_employ_gb_question).to have_error_not_a_number
    expect(respondents_details_page.organisation_more_than_one_site_question).to have_error_not_a_number
  end

  scenario "correctly will enable user to check answers and return to edit them" do
    respondents_details_page.load(locale: current_locale_parameter)

    given_i_am(:company01)

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
    visit confirmation_of_supplied_details_path
    confirmation_of_supplied_details_page.confirmation_of_respondents_details_answers.edit_page_link.click

    expect(respondents_details_page).to be_displayed
    expect(respondents_details_page.case_number_question.field.value).to eql user.case_number
    expect(respondents_details_page.name_question.field.value).to eql user.name
    expect(respondents_details_page.contact_question.field.value).to eql user.contact
    expect(respondents_details_page.building_name_question.field.value).to eql user.building_name
    expect(respondents_details_page.street_question.field.value).to eql user.street_name
    expect(respondents_details_page.town_question.field.value).to eql user.town
    expect(respondents_details_page.county_question.field.value).to eql user.county
    expect(respondents_details_page.postcode_question.field.value).to eql user.postcode
    expect(respondents_details_page.dx_number_question.field.value).to eql user.dx_number
    expect(respondents_details_page.contact_number_question.field.value).to eql user.contact_number
    expect(respondents_details_page.contact_mobile_number_question.field.value).to eql user.contact_mobile_number
    expect(respondents_details_page.contact_preference_question.select_email.has_checked_field?).to be true if user.contact_preference == "Email"
    expect(respondents_details_page.contact_preference_question.preference_email.value).to eql user.email_address if user.contact_preference == "Email"
    expect(respondents_details_page.contact_preference_question.select_post.has_checked_field?).to be true if user.contact_preference == "Post"
    expect(respondents_details_page.contact_preference_question.select_fax.has_checked_field?).to be true if user.contact_preference == "Fax"
    expect(respondents_details_page.contact_preference_question.preference_fax.value).to eql user.fax_number if user.contact_preference == "Fax"
    expect(respondents_details_page.organisation_employ_gb_question.field.value.to_i).to eql user.organisation_employ_gb
    expect(respondents_details_page.organisation_more_than_one_site_question.get).to eql user.organisation_more_than_one_site
    expect(respondents_details_page.organisation_more_than_one_site_question.employment_at_site_number.value).to eql user.employment_at_site_number if user.organisation_more_than_one_site == "Yes"
  end
end

require 'rails_helper'
RSpec.feature "Fill in Respondents Details Page", js: true do
  let(:claimants_details_page) { ET3::Test::ClaimantsDetailsPage.new }

  before do
    stub_valid_office_code
  end

  scenario "correctly will enable user to continue to next page" do
    respondents_details_page.load(locale: current_locale_parameter)
    given_valid_data
    answer_respondents_details

    expect(claimants_details_page).to be_displayed
  end

  scenario "incorrectly will provide many errors" do
    respondents_details_page.load(locale: current_locale_parameter)
    given_invalid_data

    user = FactoryBot.create(:respondent, :respondent_invalid, case_number: '7@54321/2017', name: '', postcode: 'sfsdf', organisation_more_than_one_site: :"questions.organisation_more_than_one_site.yes.label")
    respondents_details_page.case_number_question.set(user.case_number)
    respondents_details_page.contact_question.set(user.contact)
    respondents_details_page.postcode_question.set(user.postcode)
    respondents_details_page.contact_number_question.set(user.contact_number)
    respondents_details_page.contact_preference_question.set_for(user)
    respondents_details_page.organisation_employ_gb_question.set(user.organisation_employ_gb)
    respondents_details_page.organisation_more_than_one_site_question.set_for(user)
    respondents_details_page.next

    expect(respondents_details_page).to have_header
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
    given_valid_data
    answer_respondents_details
    confirmation_of_supplied_details_page.load(locale: current_locale_parameter)
    confirmation_of_supplied_details_page.confirmation_of_respondents_details_answers.edit_page_link.click
    user = @respondent

    expect(respondents_details_page).to be_displayed
    expect(respondents_details_page).to have_header
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
    respondents_details_page.contact_preference_question.assert_answers_for(user)
    expect(respondents_details_page.organisation_employ_gb_question.field.value).to eql user.organisation_employ_gb
    respondents_details_page.organisation_more_than_one_site_question.assert_answers_for(user)
  end
end

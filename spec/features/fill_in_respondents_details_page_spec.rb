require 'rails_helper'
RSpec.feature "Fill in Respondents Details Page", js: true do
  let(:claimants_details_page) { ET3::Test::ClaimantsDetailsPage.new }

  before do
    given_valid_user
    start_a_new_et3_response
    registration_start
  end

  scenario "correctly will enable user to continue to next page" do
    respondents_details_page.load(locale: current_locale_parameter)
    given_valid_data
    answer_respondents_details

    expect(claimants_details_page).to be_displayed
  end

  scenario "hides the other title field until the other option is selected and hides it again when changed" do
    respondents_details_page.load(locale: current_locale_parameter)
    expect(respondents_details_page).not_to have_other_title_question
    respondents_details_page.title_question.set(:Other)
    expect(respondents_details_page).to have_other_title_question
    respondents_details_page.title_question.set(:Mr)
    expect(respondents_details_page).not_to have_other_title_question
  end

  scenario "incorrectly will provide many errors" do
    respondents_details_page.load(locale: current_locale_parameter)
    given_invalid_data

    user = FactoryBot.create(:respondent, :respondent_invalid, case_number: '7@54321/2017', name: '', postcode: 'sfsdf', organisation_more_than_one_site: :"questions.respondents_details.organisation_more_than_one_site.options.yes")
    respondents_details_page.case_number_question.set(user.case_number)
    respondents_details_page.contact_question.set(user.contact)
    respondents_details_page.postcode_question.set(user.postcode)
    respondents_details_page.contact_number_question.set(user.contact_number)
    respondents_details_page.contact_preference_question.set(user.contact_preference.to_s.split('.').last.to_sym)
    respondents_details_page.email_address_question.set(user.email_address) if user.contact_preference.to_s.split('.').last == 'email'
    respondents_details_page.fax_number_question.set(user.fax_number) if user.contact_preference.to_s.split('.').last == 'fax'
    respondents_details_page.organisation_employ_gb_question.set(user.organisation_employ_gb)
    respondents_details_page.organisation_more_than_one_site_question.set(user.organisation_more_than_one_site.to_s.split('.').last.to_sym)
    respondents_details_page.employment_at_site_number_question.set(user.employment_at_site_number) if user.organisation_more_than_one_site.to_s.split('.')[-2] == 'yes'
    respondents_details_page.video_call_question.set(user.video_call)
    respondents_details_page.next

    expect(respondents_details_page).to have_header
    expect(respondents_details_page).to have_error_header
    respondents_details_page.case_number_question.assert_error_message(t('errors.messages.invalid'))
    respondents_details_page.name_question.assert_error_message(t('errors.messages.blank'))
    respondents_details_page.contact_question.assert_error_message(t('errors.messages.contains_numbers'))
    respondents_details_page.building_name_question.assert_error_message(t('errors.messages.blank'))
    respondents_details_page.street_question.assert_error_message(t('errors.messages.blank'))
    respondents_details_page.town_question.assert_error_message(t('errors.messages.blank'))
    respondents_details_page.postcode_question.assert_error_message(t('errors.messages.invalid_postcode'))
    respondents_details_page.fax_number_question.assert_error_message(t('errors.messages.invalid_phone_number'))
    respondents_details_page.organisation_employ_gb_question.assert_error_message(t('errors.custom.organisation_employ_gb.not_a_number'))
    respondents_details_page.employment_at_site_number_question.assert_error_message(t('errors.custom.organisation_more_than_one_site.not_a_number'))
    respondents_details_page.video_call_question.assert_error_message(t('errors.messages.inclusion'))
  end

  scenario "correctly will enable user to check answers and return to edit them" do
    respondents_details_page.load(locale: current_locale_parameter)
    given_valid_data
    answer_respondents_details
    confirmation_of_supplied_details_page.load(locale: current_locale_parameter)
    confirmation_of_supplied_details_page.confirmation_of_respondents_details_answers.edit_respondent_details_page_link.click
    user = @respondent

    expect(respondents_details_page).to be_displayed
    expect(respondents_details_page).to have_header
    expect(respondents_details_page.case_number_question.value).to eql user.case_number
    expect(respondents_details_page.name_question.value).to eql user.name
    expect(respondents_details_page.contact_question.value).to eql user.contact
    expect(respondents_details_page.building_name_question.value).to eql user.building_name
    expect(respondents_details_page.street_question.value).to eql user.street_name
    expect(respondents_details_page.town_question.value).to eql user.town
    expect(respondents_details_page.county_question.value).to eql user.county
    expect(respondents_details_page.postcode_question.value).to eql user.postcode
    expect(respondents_details_page.dx_number_question.value).to eql user.dx_number
    expect(respondents_details_page.contact_number_question.value).to eql user.contact_number
    expect(respondents_details_page.contact_mobile_number_question.value).to eql user.contact_mobile_number
    expect(respondents_details_page.contact_preference_question.value).to eql t(user.contact_preference)
    expect(respondents_details_page.email_address_question.value).to eql user.email_address if user.contact_preference.to_s.split('.').last == 'email'
    expect(respondents_details_page.fax_number_question.value).to eql user.fax_number if user.contact_preference.to_s.split('.').last == 'fax'
    expect(respondents_details_page.organisation_employ_gb_question.value).to eql user.organisation_employ_gb
    expect(respondents_details_page.organisation_more_than_one_site_question.value).to eql t(user.organisation_more_than_one_site)
    expect(respondents_details_page.employment_at_site_number_question.value).to eql user.employment_at_site_number if user.organisation_more_than_one_site.to_s.split('.').last == 'yes'
    respondents_details_page.video_call_question.set(user.video_call.to_s.split('.').last.to_sym)
  end
end

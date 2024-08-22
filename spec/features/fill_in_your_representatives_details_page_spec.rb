require 'rails_helper'
RSpec.feature "Fill in Your Representatives Details Page", js: true do
  let(:disability_page) { ET3::Test::DisabilityPage.new }

  before do
    given_valid_user
    start_a_new_et3_response
    registration_start
  end

  scenario "correctly will enable user to continue to next page" do
    your_representatives_details_page.load(locale: current_locale_parameter)
    given_valid_data

    user = @representative

    your_representatives_details_page.type_of_representative_question.set(user.type.to_s.split('.').last.to_sym)
    your_representatives_details_page.representative_org_name_question.set(user.organisation_name)
    your_representatives_details_page.representative_name_question.set(user.name)
    your_representatives_details_page.representative_building_question.set(user.building)
    your_representatives_details_page.representative_street_question.set(user.street)
    your_representatives_details_page.representative_town_question.set(user.locality)
    your_representatives_details_page.representative_county_question.set(user.county)
    your_representatives_details_page.representative_postcode_question.set(user.post_code)
    your_representatives_details_page.representative_phone_question.set(user.telephone_number)
    your_representatives_details_page.representative_mobile_question.set(user.representative_mobile)
    your_representatives_details_page.representative_dx_number_question.set(user.dx_number)
    your_representatives_details_page.representative_reference_question.set(user.representative_reference)
    your_representatives_details_page.representative_contact_preference_question.set(user.representative_contact_preference.to_s.split('.').last.to_sym)
    if user.representative_contact_preference.end_with?('.email')
      your_representatives_details_page.preference_email.set(user.representative_email)
    end
    your_representatives_details_page.allow_phone_or_video_attendance_question.set(user.allow_phone_or_video_attendance)
    your_representatives_details_page.next

    expect(disability_page).to be_displayed
  end

  scenario "incorrectly will provide errors" do
    your_representatives_details_page.load(locale: current_locale_parameter)
    given_invalid_data

    user = @representative

    your_representatives_details_page.representative_name_question.set(user.name)
    your_representatives_details_page.representative_postcode_question.set(user.post_code)
    your_representatives_details_page.representative_phone_question.set(user.telephone_number)
    your_representatives_details_page.representative_mobile_question.set(user.representative_mobile)
    your_representatives_details_page.representative_dx_number_question.set(user.dx_number)
    your_representatives_details_page.representative_reference_question.set(user.representative_reference)
    your_representatives_details_page.representative_contact_preference_question.set(user.representative_contact_preference.to_s.split('.').last.to_sym)
    if user.representative_contact_preference.end_with?('.email')
      your_representatives_details_page.preference_email.set(user.representative_email)
    end
    your_representatives_details_page.next

    expect(your_representatives_details_page).to have_error_header
    your_representatives_details_page.type_of_representative_question.assert_error_message(t('errors.custom.type_of_representative.inclusion'))
    your_representatives_details_page.representative_name_question.assert_error_message(t('errors.messages.contains_numbers'))
    your_representatives_details_page.representative_building_question.assert_error_message(t('errors.messages.blank'))
    your_representatives_details_page.representative_street_question.assert_error_message(t('errors.messages.blank'))
    your_representatives_details_page.representative_town_question.assert_error_message(t('errors.messages.blank'))
    your_representatives_details_page.representative_postcode_question.assert_error_message(t('errors.messages.invalid_postcode'))
    your_representatives_details_page.representative_phone_question.assert_error_message(t('errors.messages.invalid_phone_number'))
    your_representatives_details_page.representative_mobile_question.assert_error_message(t('errors.messages.invalid_phone_number'))
    your_representatives_details_page.preference_email.assert_error_message(t('errors.messages.invalid_email'))
  end

  scenario "correctly will enable user to check answers and return to edit them" do
    your_representatives_details_page.load(locale: current_locale_parameter)
    given_valid_data
    user = @representative

    your_representatives_details_page.type_of_representative_question.set(user.type.to_s.split('.').last.to_sym)
    your_representatives_details_page.representative_org_name_question.set(user.organisation_name)
    your_representatives_details_page.representative_name_question.set(user.name)
    your_representatives_details_page.representative_building_question.set(user.building)
    your_representatives_details_page.representative_street_question.set(user.street)
    your_representatives_details_page.representative_town_question.set(user.locality)
    your_representatives_details_page.representative_county_question.set(user.county)
    your_representatives_details_page.representative_postcode_question.set(user.post_code)
    your_representatives_details_page.representative_phone_question.set(user.telephone_number)
    your_representatives_details_page.representative_mobile_question.set(user.representative_mobile)
    your_representatives_details_page.representative_dx_number_question.set(user.dx_number)
    your_representatives_details_page.representative_reference_question.set(user.representative_reference)
    your_representatives_details_page.representative_contact_preference_question.set(user.representative_contact_preference.to_s.split('.').last.to_sym)
    if user.representative_contact_preference.end_with?('.email')
      your_representatives_details_page.preference_email.set(user.representative_email)
    end
    your_representatives_details_page.next

    confirmation_of_supplied_details_page.load(locale: current_locale_parameter)
    confirmation_of_supplied_details_page.confirmation_of_your_representatives_details_answers.edit_representative_details_page_link.click

    expect(your_representatives_details_page).to be_displayed
    expect(your_representatives_details_page.type_of_representative_question.value).to eql(t(user.type))
    expect(your_representatives_details_page.representative_org_name_question.value).to eql user.organisation_name
    expect(your_representatives_details_page.representative_name_question.value).to eql user.name
    expect(your_representatives_details_page.representative_building_question.value).to eql user.building
    expect(your_representatives_details_page.representative_street_question.value).to eql user.street
    expect(your_representatives_details_page.representative_town_question.value).to eql user.locality
    expect(your_representatives_details_page.representative_county_question.value).to eql user.county
    expect(your_representatives_details_page.representative_postcode_question.value).to eql user.post_code
    expect(your_representatives_details_page.representative_phone_question.value).to eql user.telephone_number
    expect(your_representatives_details_page.representative_mobile_question.value).to eql user.representative_mobile
    expect(your_representatives_details_page.representative_dx_number_question.value).to eql user.dx_number
    expect(your_representatives_details_page.representative_reference_question.value).to eql user.representative_reference
    expect(your_representatives_details_page.representative_contact_preference_question.value).to eql(t(user.representative_contact_preference))
    if user.representative_contact_preference.end_with?('.email')
      expect(your_representatives_details_page.preference_email.value).to eql user.representative_email
    end
    your_representatives_details_page.allow_phone_or_video_attendance_question.set(user.allow_phone_or_video_attendance)
  end
end

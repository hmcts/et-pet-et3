require 'rails_helper'
RSpec.feature "Fill in Your Representatives Details Page", js: true do
  let(:disability_page) { ET3::Test::DisabilityPage.new }

  scenario "correctly will enable user to continue to next page" do
    your_representatives_details_page.load(locale: current_locale_parameter)
    given_valid_data

    user = @representative

    your_representatives_details_page.type_of_representative_question.set_for(user)
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
    your_representatives_details_page.representative_contact_preference_question.set_for(user)
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
    your_representatives_details_page.representative_contact_preference_question.set_for(user)
    your_representatives_details_page.next

    expect(your_representatives_details_page).to have_error_header
    expect(your_representatives_details_page.type_of_representative_question).to have_error_inclusion
    expect(your_representatives_details_page.representative_name_question).to have_error_contains_numbers
    expect(your_representatives_details_page.representative_building_question).to have_error_blank
    expect(your_representatives_details_page.representative_street_question).to have_error_blank
    expect(your_representatives_details_page.representative_town_question).to have_error_blank
    expect(your_representatives_details_page.representative_postcode_question).to have_error_invalid_postcode
    expect(your_representatives_details_page.representative_phone_question).to have_error_invalid_phone_number
    expect(your_representatives_details_page.representative_mobile_question).to have_error_invalid_phone_number
    expect(your_representatives_details_page.representative_contact_preference_question).to have_error_invalid_email
  end

  scenario "correctly will enable user to check answers and return to edit them" do
    your_representatives_details_page.load(locale: current_locale_parameter)
    given_valid_data
    user = @representative

    your_representatives_details_page.type_of_representative_question.set_for(user)
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
    your_representatives_details_page.representative_contact_preference_question.set_for(user)
    your_representatives_details_page.next

    confirmation_of_supplied_details_page.load(locale: current_locale_parameter)
    confirmation_of_supplied_details_page.confirmation_of_your_representatives_details_answers.edit_page_link.click

    expect(your_representatives_details_page).to be_displayed
    your_representatives_details_page.type_of_representative_question.assert_answer(user.type)
    expect(your_representatives_details_page.representative_org_name_question.field.value).to eql user.organisation_name
    expect(your_representatives_details_page.representative_name_question.field.value).to eql user.name
    expect(your_representatives_details_page.representative_building_question.field.value).to eql user.building
    expect(your_representatives_details_page.representative_street_question.field.value).to eql user.street
    expect(your_representatives_details_page.representative_town_question.field.value).to eql user.locality
    expect(your_representatives_details_page.representative_county_question.field.value).to eql user.county
    expect(your_representatives_details_page.representative_postcode_question.field.value).to eql user.post_code
    expect(your_representatives_details_page.representative_phone_question.field.value).to eql user.telephone_number
    expect(your_representatives_details_page.representative_mobile_question.field.value).to eql user.representative_mobile
    expect(your_representatives_details_page.representative_dx_number_question.field.value).to eql user.dx_number
    expect(your_representatives_details_page.representative_reference_question.field.value).to eql user.representative_reference
    your_representatives_details_page.representative_contact_preference_question.assert_answers_for(user)
  end
end

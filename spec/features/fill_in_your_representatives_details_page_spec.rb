require 'rails_helper'
RSpec.feature "Fill in Your Representatives Details Page", js: true do
  let(:disability_page) { ET3::Test::DisabilityPage.new }

  scenario "correctly will enable user to continue to next page" do
    your_representatives_details_page.load(locale: current_locale_parameter)

    given_i_am

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

    your_representatives_details_page.next

    expect(disability_page).to be_displayed
  end

  scenario "incorrectly will provide errors" do
    your_representatives_details_page.load(locale: current_locale_parameter)

    given_invalid_data

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

    given_i_am

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

    your_representatives_details_page.next
    confirmation_of_supplied_details_page.load(locale: current_locale_parameter)
    confirmation_of_supplied_details_page.confirmation_of_your_representatives_details_answers.edit_page_link.click

    expect(your_representatives_details_page).to be_displayed
    case user.type_of_representative
    when "Citizen's advice bureau"
      expect(your_representatives_details_page.type_of_representative_question.citizens_advice_bureau.has_checked_field?).to be true
    when "Free representation unit"
      expect(your_representatives_details_page.type_of_representative_question.free_representative_unit.has_checked_field?).to be true
    when "Law centre"
      expect(your_representatives_details_page.type_of_representative_question.law_centre.has_checked_field?).to be true
    when "Union"
      expect(your_representatives_details_page.type_of_representative_question.union.has_checked_field?).to be true
    when "Solicitor"
      expect(your_representatives_details_page.type_of_representative_question.solicitor.has_checked_field?).to be true
    when "Private individual"
      expect(your_representatives_details_page.type_of_representative_question.private_individual.has_checked_field?).to be true
    when "Trade association"
      expect(your_representatives_details_page.type_of_representative_question.trade_association.has_checked_field?).to be true
    when "Other"
      expect(your_representatives_details_page.type_of_representative_question.other.has_checked_field?).to be true
    end

    expect(your_representatives_details_page.representative_org_name_question.field.value).to eql user.representative_org_name
    expect(your_representatives_details_page.representative_name_question.field.value).to eql user.representative_name
    expect(your_representatives_details_page.representative_building_question.field.value).to eql user.representative_building
    expect(your_representatives_details_page.representative_street_question.field.value).to eql user.representative_street
    expect(your_representatives_details_page.representative_town_question.field.value).to eql user.representative_town
    expect(your_representatives_details_page.representative_county_question.field.value).to eql user.representative_county
    expect(your_representatives_details_page.representative_postcode_question.field.value).to eql user.representative_postcode
    expect(your_representatives_details_page.representative_phone_question.field.value).to eql user.representative_phone
    expect(your_representatives_details_page.representative_mobile_question.field.value).to eql user.representative_mobile
    expect(your_representatives_details_page.representative_dx_number_question.field.value).to eql user.representative_dx_number
    expect(your_representatives_details_page.representative_reference_question.field.value).to eql user.representative_reference
    expect(your_representatives_details_page.representative_contact_preference_question.select_email.has_checked_field?).to be true if user.representative_contact_preference == 'Email'
    expect(your_representatives_details_page.representative_contact_preference_question.preference_email.root_element.value).to eql user.representative_email if user.representative_contact_preference == 'Email'
    expect(your_representatives_details_page.representative_contact_preference_question.select_post.has_checked_field?).to be true if user.representative_contact_preference == 'Post'
    expect(your_representatives_details_page.representative_contact_preference_question.select_fax.has_checked_field?).to be true if user.representative_contact_preference == 'Fax'
    expect(your_representatives_details_page.representative_contact_preference_question.preference_fax.root_element.value).to eql user.representative_fax if user.representative_contact_preference == 'Fax'
  end
end

require 'rails_helper'
RSpec.feature "Fill in Confirmation of Supplied Details Page", js: true do
  let(:form_submission_page) { ET3::Test::FormSubmissionPage.new }

  scenario "correctly will enable user to continue to next page" do
    confirmation_of_supplied_details_page.load

    given_i_am(:company01)

    answer_email_receipt_question
    answer_confirm_email_receipt_question

    # TODO: Use appropriate context blocks

    # Check respondent's details table
    expect(confirmation_of_supplied_details_page).to have_confirmation_of_respondents_details_answers

    respondents_details_table = confirmation_of_supplied_details_page.confirmation_of_respondents_details_answers
    expect(respondents_details_table.case_number_row.case_number_answer).to have_text "7654321/2017"
    expect(respondents_details_table.name_row.name_answer).to have_text "dodgy_co"
    expect(respondents_details_table.contact_row.contact_answer).to have_text "john"
    expect(respondents_details_table.building_name_row.building_name_answer).to have_text "the_shard"
    expect(respondents_details_table.street_row.street_answer).to have_text "downing_street"
    expect(respondents_details_table.town_row.town_answer).to have_text "westminster"
    expect(respondents_details_table.county_row.county_answer).to have_text ""
    expect(respondents_details_table.postcode_row.postcode_answer).to have_text "wc1 1aa"
    expect(respondents_details_table.dx_number_row.dx_number_answer).to have_text ""
    expect(respondents_details_table.contact_number_row.contact_number_answer).to have_text ""
    expect(respondents_details_table.mobile_number_row.mobile_number_answer).to have_text ""
    expect(respondents_details_table.contact_preference_row.contact_preference_answer).to have_text "email"
    expect(respondents_details_table.email_address_row.email_address_answer).to have_text "john@dodgyco.com"
    expect(respondents_details_table.fax_number_row.fax_number_answer).to have_text ""
    expect(respondents_details_table.organisation_employ_gb_row.organisation_employ_gb_answer).to have_text ""
    expect(respondents_details_table.organisation_more_than_one_site_row.organisation_more_than_one_site_answer).to have_text "No"
    expect(respondents_details_table.employment_at_site_number_row.employment_at_site_number_answer).to have_text "No"

    expect(confirmation_of_supplied_details_page).to have_confirmation_of_claimants_details_answers
    expect(confirmation_of_supplied_details_page).to have_confirmation_of_earnings_and_benefits_answers
    expect(confirmation_of_supplied_details_page).to have_confirmation_of_response_answers
    expect(confirmation_of_supplied_details_page).to have_confirmation_of_your_representative_answers
    expect(confirmation_of_supplied_details_page).to have_confirmation_of_employer_contract_claim_answers

    confirmation_of_supplied_details_page.submit_form

    expect(form_submission_page).to be_displayed
  end
end

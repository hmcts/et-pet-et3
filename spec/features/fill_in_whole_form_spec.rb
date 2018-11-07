require 'rails_helper'
RSpec.feature "Fill in whole form", js: true do

  before do
    stub_et_api
    stub_presigned_url_api_for_s3
  end

  scenario "correctly will flow without error" do
    include ET3::Test::S3Helpers

    given_i_am(:company01)

    answer_all_questions

    # Check respondent's details table
    expect(confirmation_of_supplied_details_page).to have_confirmation_of_respondents_details_answers

    respondents_details_table = confirmation_of_supplied_details_page.confirmation_of_respondents_details_answers
    expect(respondents_details_table.case_number_row.case_number_answer).to have_text "1454321/2017"
    expect(respondents_details_table.name_row.name_answer).to have_text "dodgy_co"
    expect(respondents_details_table.contact_row.contact_answer).to have_text "John Smith"
    expect(respondents_details_table.building_name_row.building_name_answer).to have_text "the_shard"
    expect(respondents_details_table.street_row.street_answer).to have_text "downing_street"
    expect(respondents_details_table.town_row.town_answer).to have_text "westminster"
    expect(respondents_details_table.county_row.county_answer).to have_text nil
    expect(respondents_details_table.postcode_row.postcode_answer).to have_text "wc1 1aa"
    expect(respondents_details_table.dx_number_row.dx_number_answer).to have_text nil
    expect(respondents_details_table.contact_number_row.contact_number_answer).to have_text nil
    expect(respondents_details_table.mobile_number_row.mobile_number_answer).to have_text nil
    expect(respondents_details_table.contact_preference_row.contact_preference_answer).to have_text "email"
    expect(respondents_details_table.email_address_row.email_address_answer).to have_text "john@dodgyco.com"
    expect(respondents_details_table.fax_number_row.fax_number_answer).to have_text nil
    expect(respondents_details_table.organisation_employ_gb_row.organisation_employ_gb_answer).to have_text nil
    expect(respondents_details_table.organisation_more_than_one_site_row.organisation_more_than_one_site_answer).to have_text nil
    expect(respondents_details_table.employment_at_site_number_row.employment_at_site_number_answer).to have_text nil

    # Check Claimant's Details Table
    expect(confirmation_of_supplied_details_page).to have_confirmation_of_claimants_details_answers

    claimants_details_table = confirmation_of_supplied_details_page.confirmation_of_claimants_details_answers
    expect(claimants_details_table.claimants_name_row.claimants_name_answer).to have_text "Jane Doe"
    expect(claimants_details_table.agree_with_early_conciliation_details_row.agree_with_early_conciliation_details_answer).to have_text "false"
    expect(claimants_details_table.disagree_conciliation_reason_row.disagree_conciliation_reason_answer).to have_text "lorem ipsum conciliation"
    expect(claimants_details_table.agree_with_employment_dates_row.agree_with_employment_dates_answer).to have_text "false"
    expect(claimants_details_table.employment_start_row.employment_start_answer).to have_text "2017-01-01"
    expect(claimants_details_table.employment_end_row.employment_end_answer).to have_text "2017-12-31"
    expect(claimants_details_table.disagree_employment_row.disagree_employment_answer).to have_text "lorem ipsum employment"
    expect(claimants_details_table.continued_employment_row.continued_employment_answer).to have_text false
    expect(claimants_details_table.agree_with_claimants_description_of_job_or_title_row.agree_with_claimants_description_of_job_or_title_answer).to have_text false
    expect(claimants_details_table.disagree_claimants_job_or_title_row.disagree_claimants_job_or_title_answer).to have_text "lorem ipsum job title"

    # Check Earnings and Benefits Table
    expect(confirmation_of_supplied_details_page).to have_confirmation_of_earnings_and_benefits_answers

    earnings_and_benefits_table = confirmation_of_supplied_details_page.confirmation_of_earnings_and_benefits_answers
    expect(earnings_and_benefits_table.agree_with_claimants_hours_row.agree_with_claimants_hours_answer).to have_text false
    expect(earnings_and_benefits_table.queried_hours_row.queried_hours_answer).to have_text "32"
    expect(earnings_and_benefits_table.agree_with_earnings_details_row.agree_with_earnings_details_answer).to have_text false
    expect(earnings_and_benefits_table.queried_pay_before_tax_row.queried_pay_before_tax_answer).to have_text "£1,000.00"
    expect(earnings_and_benefits_table.queried_pay_before_tax_period_row.queried_pay_before_tax_period_answer).to have_text "Monthly"
    expect(earnings_and_benefits_table.queried_take_home_pay_row.queried_take_home_pay_answer).to have_text "£900.00"
    expect(earnings_and_benefits_table.queried_take_home_pay_period_row.queried_take_home_pay_period_answer).to have_text "Monthly"
    expect(earnings_and_benefits_table.agree_with_claimant_notice_row.agree_with_claimant_notice_answer).to have_text false
    expect(earnings_and_benefits_table.disagree_claimant_notice_reason_row.disagree_claimant_notice_reason_answer).to have_text "lorem ipsum notice reason"
    expect(earnings_and_benefits_table.agree_with_claimant_pension_benefits_row.agree_with_claimant_pension_benefits_answer).to have_text false
    expect(earnings_and_benefits_table.disagree_claimant_pension_benefits_reason_row.disagree_claimant_pension_benefits_reason_answer).to have_text "lorem ipsum claimant pension"

    # Check Response Table
    expect(confirmation_of_supplied_details_page).to have_confirmation_of_response_answers

    response_table = confirmation_of_supplied_details_page.confirmation_of_response_answers
    expect(response_table.defend_claim_row.defend_claim_answer).to have_text true
    expect(response_table.defend_claim_facts_row.defend_claim_facts_answer).to have_text "lorem ipsum defence"

    # Check Your Representative Table
    expect(confirmation_of_supplied_details_page).to have_confirmation_of_your_representative_answers

    your_representative_table = confirmation_of_supplied_details_page.confirmation_of_your_representative_answers
    expect(your_representative_table.have_representative_row.have_representative_answer).to have_text true

    # Check Your Representative's Details Table
    expect(confirmation_of_supplied_details_page).to have_confirmation_of_your_representatives_details_answers

    your_rep_details_table = confirmation_of_supplied_details_page.confirmation_of_your_representatives_details_answers
    expect(your_rep_details_table.type_of_representative_row.type_of_representative_answer).to have_text "Private Individual"
    expect(your_rep_details_table.representative_org_name_row.representative_org_name_answer).to have_text "repco ltd"
    expect(your_rep_details_table.representative_name_row.representative_name_answer).to have_text "Jane Doe"
    expect(your_rep_details_table.representative_building_row.representative_building_answer).to have_text "Rep Building"
    expect(your_rep_details_table.representative_street_row.representative_street_answer).to have_text "Rep Street"
    expect(your_rep_details_table.representative_town_row.representative_town_answer).to have_text "Rep Town"
    expect(your_rep_details_table.representative_county_row.representative_county_answer).to have_text "Rep County"
    expect(your_rep_details_table.representative_postcode_row.representative_postcode_answer).to have_text "WC2 2BB"
    expect(your_rep_details_table.representative_phone_row.representative_phone_answer).to have_text "0207 987 6543"
    expect(your_rep_details_table.representative_mobile_row.representative_mobile_answer).to have_text "07987654321"
    expect(your_rep_details_table.representative_dx_number_row.representative_dx_number_answer).to have_text "dx address"
    expect(your_rep_details_table.representative_reference_row.representative_reference_answer).to have_text "Rep Ref"
    expect(your_rep_details_table.representative_contact_preference_row.representative_contact_preference_answer).to have_text "fax"
    expect(your_rep_details_table.email_row.email_answer).to have_text nil
    expect(your_rep_details_table.fax_row.fax_answer).to have_text "0207 345 6789"

    # Check Disability Table
    expect(confirmation_of_supplied_details_page).to have_confirmation_of_disability_answers

    disability_table = confirmation_of_supplied_details_page.confirmation_of_disability_answers
    expect(disability_table.disability_row.disability_answer).to have_text true
    expect(disability_table.disability_information_row.disability_information_answer).to have_text "Lorem ipsum disability"

    # Check Employer Contract Claim Table
    expect(confirmation_of_supplied_details_page).to have_confirmation_of_employer_contract_claim_answers

    employer_contract_claim_table = confirmation_of_supplied_details_page.confirmation_of_employer_contract_claim_answers
    expect(employer_contract_claim_table.make_employer_contract_claim_row.make_employer_contract_claim_answer).to have_text true
    expect(employer_contract_claim_table.claim_information_row.claim_information_answer).to have_text "lorem ipsum info"

    # Check Additional Information Table
    expect(confirmation_of_supplied_details_page).to have_confirmation_of_additional_information_answers

    additional_information_table = confirmation_of_supplied_details_page.confirmation_of_additional_information_answers
    expect(additional_information_table.upload_additional_information_row.upload_additional_information_answer).to have_text(user.upload_additional_information) if user.upload_additional_information

    confirmation_of_supplied_details_page.submit_form
    expect(form_submission_page).to be_displayed
    aggregate_failures "testing request" do
      file_upload_keys = keys_in_bucket
      expect(a_request(:post, "http://api.et.127.0.0.1.nip.io:3100/api/v2/respondents/build_response").
        with { |request|
          request_body = JSON.parse(request.body)
          user_data = personas.fetch(:company01)
          expect(request_body["uuid"]).to be_an_instance_of(String)
          expect(request_body["command"]).to eql "SerialSequence"
          expect(request_body["data"][0]["command"]).to eql "BuildResponse"
          expect(request_body["data"][0]["data"]["case_number"]).to eql user_data.case_number
          expect(request_body["data"][0]["data"]["claimants_name"]).to eql user_data.claimants_name
          expect(request_body["data"][0]["data"]["agree_with_early_conciliation_details"]).to eql(user_data.agree_with_early_conciliation_details == 'Yes')
          expect(request_body["data"][0]["data"]["disagree_conciliation_reason"]).to eql user_data.disagree_conciliation_reason
          expect(request_body["data"][0]["data"]["agree_with_employment_dates"]).to eql(user_data.agree_with_employment_dates == 'Yes')
          expect(Date.parse(request_body["data"][0]["data"]["employment_start"]).strftime('%d/%m/%Y')).to eql user_data.employment_start
          expect(Date.parse(request_body["data"][0]["data"]["employment_end"]).strftime('%d/%m/%Y')).to eql user_data.employment_end
          expect(request_body["data"][0]["data"]["disagree_employment"]).to eql user_data.disagree_employment
          expect(request_body["data"][0]["data"]["continued_employment"]).to eql(user_data.continued_employment == 'Yes')
          expect(request_body["data"][0]["data"]["agree_with_claimants_description_of_job_or_title"]).to eql(user_data.agree_with_claimants_description_of_job_or_title == 'Yes')
          expect(request_body["data"][0]["data"]["disagree_claimants_job_or_title"]).to eql user_data.disagree_claimants_job_or_title
          expect(request_body["data"][0]["data"]["agree_with_claimants_hours"]).to eql(user_data.agree_with_claimants_hours == 'Yes')
          expect(request_body["data"][0]["data"]["queried_hours"]).to eql user_data.queried_hours.to_f
          expect(request_body["data"][0]["data"]["agree_with_earnings_details"]).to eql(user_data.agree_with_earnings_details == 'Yes')
          expect(request_body["data"][0]["data"]["queried_pay_before_tax"]).to eql user_data.queried_pay_before_tax.to_f
          expect(request_body["data"][0]["data"]["queried_pay_before_tax_period"]).to eql user_data.queried_pay_before_tax_period
          expect(request_body["data"][0]["data"]["queried_take_home_pay"]).to eql user_data.queried_take_home_pay.to_f
          expect(request_body["data"][0]["data"]["queried_take_home_pay_period"]).to eql user_data.queried_take_home_pay_period
          expect(request_body["data"][0]["data"]["agree_with_claimant_notice"]).to eql(user_data.agree_with_claimant_notice == 'Yes')
          expect(request_body["data"][0]["data"]["disagree_claimant_notice_reason"]).to eql user_data.disagree_claimant_notice_reason
          expect(request_body["data"][0]["data"]["agree_with_claimant_pension_benefits"]).to eql(user_data.agree_with_claimant_pension_benefits == 'Yes')
          expect(request_body["data"][0]["data"]["disagree_claimant_pension_benefits_reason"]).to eql user_data.disagree_claimant_pension_benefits_reason
          expect(request_body["data"][0]["data"]["defend_claim"]).to eql(user_data.defend_claim == 'Yes')
          expect(request_body["data"][0]["data"]["defend_claim_facts"]).to eql user_data.defend_claim_facts
          expect(request_body["data"][0]["data"]["make_employer_contract_claim"]).to eql(user_data.make_employer_contract_claim == 'Yes')
          expect(request_body["data"][0]["data"]["claim_information"]).to eql user_data.claim_information
          expect(file_upload_keys).to include request_body["data"][0]["data"]["additional_information_key"]
          expect(request_body["data"][0]["data"]["email_receipt"]).to eql user_data.email_receipt
          expect(request_body["data"][0]["uuid"]).to be_an_instance_of(String)
          expect(request_body["data"][1]["command"]).to eql "BuildRespondent"
          expect(request_body["data"][1]["data"]["name"]).to eql user_data.name
          expect(request_body["data"][1]["data"]["contact"]).to eql user_data.contact
          expect(request_body["data"][1]["data"]["address_attributes"]["building"]).to eql user_data.building_name
          expect(request_body["data"][1]["data"]["address_attributes"]["street"]).to eql user_data.street_name
          expect(request_body["data"][1]["data"]["address_attributes"]["locality"]).to eql user_data.town
          expect(request_body["data"][1]["data"]["address_attributes"]["county"]).to eql user_data.county
          expect(request_body["data"][1]["data"]["address_attributes"]["post_code"]).to eql user_data.postcode
          expect(request_body["data"][1]["data"]["dx_number"]).to eql user_data.dx_number
          expect(request_body["data"][1]["data"]["address_telephone_number"]).to eql user_data.contact_number
          expect(request_body["data"][1]["data"]["alt_phone_number"]).to eql user_data.contact_mobile_number
          expect(request_body["data"][1]["data"]["contact_preference"]).to eql user_data.contact_preference
          expect(request_body["data"][1]["data"]["email_address"]).to eql user_data.email_address if user_data.contact_preference == 'email'
          expect(request_body["data"][1]["data"]["fax_number"]).to eql user_data.fax_number if user_data.contact_preference == 'fax'
          expect(request_body["data"][1]["data"]["organisation_employ_gb"]).to eql user_data.organisation_employ_gb
          expect(request_body["data"][1]["data"]["organisation_more_than_one_site"]).to eql(user_data.organisation_more_than_one_site == 'Yes')
          expect(request_body["data"][1]["data"]["employment_at_site_number"]).to eql user_data.employment_at_site_number
          expect(request_body["data"][1]["data"]["disability"]).to eql(user_data.disability == 'Yes')
          expect(request_body["data"][1]["data"]["disability_information"]).to eql user_data.disability_information
          expect(request_body["data"][1]["uuid"]).to be_an_instance_of(String)
          expect(request_body["data"][2]["command"]).to eql "BuildRepresentative"
          expect(request_body["data"][2]["data"]["name"]).to eql user_data.representative_name
          expect(request_body["data"][2]["data"]["organisation_name"]).to eql user_data.representative_org_name
          expect(request_body["data"][2]["data"]["address_attributes"]["building"]).to eql user_data.representative_building
          expect(request_body["data"][2]["data"]["address_attributes"]["street"]).to eql user_data.representative_street
          expect(request_body["data"][2]["data"]["address_attributes"]["locality"]).to eql user_data.representative_town
          expect(request_body["data"][2]["data"]["address_attributes"]["county"]).to eql user_data.representative_county
          expect(request_body["data"][2]["data"]["address_attributes"]["post_code"]).to eql user_data.representative_postcode
          expect(request_body["data"][2]["data"]["address_telephone_number"]).to eql user_data.representative_phone
          expect(request_body["data"][2]["data"]["mobile_number"]).to eql user_data.representative_mobile
          expect(request_body["data"][2]["data"]["representative_type"].capitalize).to eql user_data.type_of_representative
          expect(request_body["data"][2]["data"]["dx_number"]).to eql user_data.representative_dx_number
          expect(request_body["data"][2]["data"]["reference"]).to eql user_data.representative_reference
          expect(request_body["data"][2]["data"]["contact_preference"].capitalize).to eql user_data.representative_contact_preference
          expect(request_body["data"][2]["data"]["email_address"]).to eql user_data.representative_email if user_data.representative_contact_preference == "email"
          expect(request_body["data"][2]["data"]["fax_number"]).to eql user_data.representative_fax if user_data.representative_contact_preference == "fax"
          expect(request_body["data"][2]["uuid"]).to be_an_instance_of(String)
          expect(request.headers).to include("Content-Type" => "application/json", "Accept" => "application/json")
        }).to have_been_made.once
    end

    expect(form_submission_page).to have_submission_confirmation
    expect(form_submission_page.reference_number).to have_text "142000000100"
    expect(form_submission_page.submission_date).to have_text "13/01/2018"
    expect(form_submission_page).to have_valid_pdf_download

  end

  scenario "correctly will delete hash_store and prevent the next user seeing answers on the respondents details page" do
    given_i_am(:company01)

    answer_all_questions
    confirmation_of_supplied_details_page.submit_form
    respondents_details_page.load

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
    expect(respondents_details_page.contact_preference_question.select_email.has_checked_field?).to be false
    expect(respondents_details_page.contact_preference_question.preference_email.root_element.value).to eql ""
    expect(respondents_details_page.contact_preference_question.select_post.has_checked_field?).to be false
    expect(respondents_details_page.contact_preference_question.select_fax.has_checked_field?).to be false
    expect(respondents_details_page.contact_preference_question.preference_fax.root_element.value).to eql ""
    expect(respondents_details_page.organisation_employ_gb_question.field.value).to eql ""
    expect(respondents_details_page.organisation_more_than_one_site_question.get).to be nil
    expect(respondents_details_page.organisation_more_than_one_site_question.employment_at_site_number.root_element.value).to eql ""
  end

  scenario "correctly followed by removing the uploaded file will not submit it to the API" do
    given_i_am(:company01)

    answer_all_questions

    confirmation_of_supplied_details_page.confirmation_of_additional_information_answers.upload_additional_information_row.remove_file_link.click
    confirmation_of_supplied_details_page.submit_form

    expect(a_request(:post, "http://api.et.127.0.0.1.nip.io:3100/api/v2/respondents/build_response").
        with { |request|
          request_body = JSON.parse(request.body)
          expect(request_body["data"][0]["data"]["additional_information_key"]).to be nil
        }).to have_been_made.once
  end
end

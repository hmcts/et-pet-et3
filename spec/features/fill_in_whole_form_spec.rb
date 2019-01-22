require 'rails_helper'
RSpec.feature "Fill in whole form", js: true do

  before do
    stub_et_api
    stub_presigned_url_api_for_s3
  end

  scenario "correctly will flow without error" do
    include ET3::Test::S3Helpers
    given_valid_data
    start_a_new_et3_response
    answer_respondents_details
    answer_claimants_details
    answer_earnings_and_benefits
    answer_defend_claim_question
    answer_representative
    answer_disability_question
    answer_employers_contract_claim
    answer_additional_information

    expect(confirmation_of_supplied_details_page).to have_confirmation_of_respondents_details_answers

    respondents_details_table = confirmation_of_supplied_details_page.confirmation_of_respondents_details_answers
    expect(respondents_details_table.case_number_row.case_number_answer).to have_text @respondent.case_number
    expect(respondents_details_table.name_row.name_answer).to have_text @respondent.name
    expect(respondents_details_table.contact_row.contact_answer).to have_text @respondent.contact
    expect(respondents_details_table.building_name_row.building_name_answer).to have_text @respondent.building_name
    expect(respondents_details_table.street_row.street_answer).to have_text @respondent.street_name
    expect(respondents_details_table.town_row.town_answer).to have_text @respondent.town
    expect(respondents_details_table.county_row.county_answer).to have_text @respondent.county
    expect(respondents_details_table.postcode_row.postcode_answer).to have_text @respondent.postcode
    expect(respondents_details_table.dx_number_row.dx_number_answer).to have_text @respondent.dx_number
    expect(respondents_details_table.contact_number_row.contact_number_answer).to have_text @respondent.contact_number
    expect(respondents_details_table.mobile_number_row.mobile_number_answer).to have_text @respondent.contact_mobile_number
    expect(respondents_details_table.contact_preference_row.contact_preference_answer).to have_text t(@respondent.contact_preference)
    expect(respondents_details_table.email_address_row.email_address_answer).to have_text @respondent.email_address
    expect(respondents_details_table.fax_number_row.fax_number_answer).to have_text nil
    expect(respondents_details_table.organisation_employ_gb_row.organisation_employ_gb_answer).to have_text @respondent.organisation_employ_gb
    expect(respondents_details_table.organisation_more_than_one_site_row.organisation_more_than_one_site_answer).to have_text t(@respondent.organisation_more_than_one_site)
    expect(respondents_details_table.employment_at_site_number_row.employment_at_site_number_answer).to have_text nil

    expect(confirmation_of_supplied_details_page).to have_confirmation_of_claimants_details_answers

    claimants_details_table = confirmation_of_supplied_details_page.confirmation_of_claimants_details_answers
    expect(claimants_details_table.claimants_name_row.claimants_name_answer).to have_text @claimant.claimants_name
    expect(claimants_details_table.agree_with_early_conciliation_details_row.agree_with_early_conciliation_details_answer).to have_text t(@claimant.agree_with_early_conciliation_details)
    expect(claimants_details_table.disagree_conciliation_reason_row.disagree_conciliation_reason_answer).to have_text @claimant.disagree_conciliation_reason
    expect(claimants_details_table.agree_with_employment_dates_row.agree_with_employment_dates_answer).to have_text t(@claimant.agree_with_employment_dates)
    expect(claimants_details_table.employment_start_row.employment_start_answer).to have_text @claimant.employment_start.to_date.strftime('%Y-%m-%d')
    expect(claimants_details_table.employment_end_row.employment_end_answer).to have_text @claimant.employment_end.to_date.strftime('%Y-%m-%d')
    expect(claimants_details_table.disagree_employment_row.disagree_employment_answer).to have_text @claimant.disagree_employment
    expect(claimants_details_table.continued_employment_row.continued_employment_answer).to have_text @claimant.continued_employment
    expect(claimants_details_table.agree_with_claimants_description_of_job_or_title_row.agree_with_claimants_description_of_job_or_title_answer).to have_text t(@claimant.agree_with_claimants_description_of_job_or_title)
    expect(claimants_details_table.disagree_claimants_job_or_title_row.disagree_claimants_job_or_title_answer).to have_text @claimant.disagree_claimants_job_or_title

    expect(confirmation_of_supplied_details_page).to have_confirmation_of_earnings_and_benefits_answers

    earnings_and_benefits_table = confirmation_of_supplied_details_page.confirmation_of_earnings_and_benefits_answers
    expect(earnings_and_benefits_table.agree_with_claimants_hours_row.agree_with_claimants_hours_answer).to have_text t(@claimant.agree_with_claimants_hours)
    expect(earnings_and_benefits_table.queried_hours_row.queried_hours_answer).to have_text @claimant.queried_hours
    expect(earnings_and_benefits_table.agree_with_earnings_details_row.agree_with_earnings_details_answer).to have_text t(@claimant.agree_with_earnings_details)
    expect(earnings_and_benefits_table.queried_pay_before_tax_row.queried_pay_before_tax_answer).to have_text ActionController::Base.helpers.number_to_currency(@claimant.queried_pay_before_tax, unit: '£')
    expect(earnings_and_benefits_table.queried_pay_before_tax_period_row.queried_pay_before_tax_period_answer).to have_text @claimant.queried_pay_before_tax_period
    expect(earnings_and_benefits_table.queried_take_home_pay_row.queried_take_home_pay_answer).to have_text ActionController::Base.helpers.number_to_currency(@claimant.queried_take_home_pay, unit: '£')
    expect(earnings_and_benefits_table.queried_take_home_pay_period_row.queried_take_home_pay_period_answer).to have_text @claimant.queried_take_home_pay_period
    expect(earnings_and_benefits_table.agree_with_claimant_notice_row.agree_with_claimant_notice_answer).to have_text t(@claimant.agree_with_claimant_notice)
    expect(earnings_and_benefits_table.disagree_claimant_notice_reason_row.disagree_claimant_notice_reason_answer).to have_text @claimant.disagree_claimant_notice_reason
    expect(earnings_and_benefits_table.agree_with_claimant_pension_benefits_row.agree_with_claimant_pension_benefits_answer).to have_text t(@claimant.agree_with_claimant_pension_benefits)
    expect(earnings_and_benefits_table.disagree_claimant_pension_benefits_reason_row.disagree_claimant_pension_benefits_reason_answer).to have_text @claimant.disagree_claimant_pension_benefits_reason

    expect(confirmation_of_supplied_details_page).to have_confirmation_of_response_answers

    response_table = confirmation_of_supplied_details_page.confirmation_of_response_answers
    expect(response_table.defend_claim_row.defend_claim_answer).to have_text t(@claimant.defend_claim)
    expect(response_table.defend_claim_facts_row.defend_claim_facts_answer).to have_text @claimant.defend_claim_facts

    expect(confirmation_of_supplied_details_page).to have_confirmation_of_your_representative_answers

    your_representative_table = confirmation_of_supplied_details_page.confirmation_of_your_representative_answers
    expect(your_representative_table.have_representative_row.have_representative_answer).to have_text t(@respondent.have_representative)

    expect(confirmation_of_supplied_details_page).to have_confirmation_of_your_representatives_details_answers

    your_rep_details_table = confirmation_of_supplied_details_page.confirmation_of_your_representatives_details_answers
    expect(your_rep_details_table.type_of_representative_row.type_of_representative_answer).to have_text t(@representative.type)
    expect(your_rep_details_table.representative_org_name_row.representative_org_name_answer).to have_text @representative.organisation_name
    expect(your_rep_details_table.representative_name_row.representative_name_answer).to have_text @representative.name
    expect(your_rep_details_table.representative_building_row.representative_building_answer).to have_text @representative.building
    expect(your_rep_details_table.representative_street_row.representative_street_answer).to have_text @representative.street
    expect(your_rep_details_table.representative_town_row.representative_town_answer).to have_text @representative.locality
    expect(your_rep_details_table.representative_county_row.representative_county_answer).to have_text @representative.county
    expect(your_rep_details_table.representative_postcode_row.representative_postcode_answer).to have_text @representative.post_code
    expect(your_rep_details_table.representative_phone_row.representative_phone_answer).to have_text @representative.telephone_number
    expect(your_rep_details_table.representative_mobile_row.representative_mobile_answer).to have_text @representative.representative_mobile
    expect(your_rep_details_table.representative_dx_number_row.representative_dx_number_answer).to have_text @representative.dx_number
    expect(your_rep_details_table.representative_reference_row.representative_reference_answer).to have_text @representative.representative_reference
    expect(your_rep_details_table.representative_contact_preference_row.representative_contact_preference_answer).to have_text @representative.representative_contact_preference.downcase
    expect(your_rep_details_table.email_row.email_answer).to have_text nil
    expect(your_rep_details_table.fax_row.fax_answer).to have_text @representative.representative_fax

    expect(confirmation_of_supplied_details_page).to have_confirmation_of_disability_answers

    disability_table = confirmation_of_supplied_details_page.confirmation_of_disability_answers
    expect(disability_table.disability_row.disability_answer).to have_text @respondent.disability
    expect(disability_table.disability_information_row.disability_information_answer).to have_text @respondent.disability_information

    expect(confirmation_of_supplied_details_page).to have_confirmation_of_employer_contract_claim_answers

    employer_contract_claim_table = confirmation_of_supplied_details_page.confirmation_of_employer_contract_claim_answers
    expect(employer_contract_claim_table.make_employer_contract_claim_row.make_employer_contract_claim_answer).to have_text t(@claimant.make_employer_contract_claim)
    expect(employer_contract_claim_table.claim_information_row.claim_information_answer).to have_text @respondent.claim_information

    expect(confirmation_of_supplied_details_page).to have_confirmation_of_additional_information_answers

    additional_information_table = confirmation_of_supplied_details_page.confirmation_of_additional_information_answers
    expect(additional_information_table.upload_additional_information_row.upload_additional_information_answer).to have_text(@respondent.upload_additional_information)

    confirmation_of_supplied_details_page.submit_form
    expect(form_submission_page).to be_displayed
    aggregate_failures "testing request" do
      file_upload_keys = keys_in_bucket
      expect(a_request(:post, "http://api.et.127.0.0.1.nip.io:3100/api/v2/respondents/build_response").
        with { |request|
          request_body = JSON.parse(request.body)
          expect(request_body["uuid"]).to be_an_instance_of(String)
          expect(request_body["command"]).to eql "SerialSequence"
          expect(request_body["data"][0]["command"]).to eql "BuildResponse"
          expect(request_body["data"][0]["data"]["case_number"]).to eql @respondent.case_number
          expect(request_body["data"][0]["data"]["claimants_name"]).to eql @claimant.claimants_name
          expect(request_body["data"][0]["data"]["agree_with_early_conciliation_details"]).to eql false
          expect(request_body["data"][0]["data"]["disagree_conciliation_reason"]).to eql @claimant.disagree_conciliation_reason
          expect(request_body["data"][0]["data"]["agree_with_employment_dates"]).to eql false
          expect(Date.parse(request_body["data"][0]["data"]["employment_start"]).strftime('%d/%m/%Y')).to eql @claimant.employment_start
          expect(Date.parse(request_body["data"][0]["data"]["employment_end"]).strftime('%d/%m/%Y')).to eql @claimant.employment_end
          expect(request_body["data"][0]["data"]["disagree_employment"]).to eql @claimant.disagree_employment
          expect(request_body["data"][0]["data"]["continued_employment"]).to eql false
          expect(request_body["data"][0]["data"]["agree_with_claimants_description_of_job_or_title"]).to eql false
          expect(request_body["data"][0]["data"]["disagree_claimants_job_or_title"]).to eql @claimant.disagree_claimants_job_or_title
          expect(request_body["data"][0]["data"]["agree_with_claimants_hours"]).to eql false
          expect(request_body["data"][0]["data"]["queried_hours"]).to eql @claimant.queried_hours
          expect(request_body["data"][0]["data"]["agree_with_earnings_details"]).to eql false
          expect(request_body["data"][0]["data"]["queried_pay_before_tax"]).to eql @claimant.queried_pay_before_tax
          expect(request_body["data"][0]["data"]["queried_pay_before_tax_period"]).to eql @claimant.queried_pay_before_tax_period.to_s.split('.')[-2].titleize
          expect(request_body["data"][0]["data"]["queried_take_home_pay"]).to eql @claimant.queried_take_home_pay
          expect(request_body["data"][0]["data"]["queried_take_home_pay_period"]).to eql @claimant.queried_take_home_pay_period.to_s.split('.')[-2].titleize
          expect(request_body["data"][0]["data"]["agree_with_claimant_notice"]).to eql false
          expect(request_body["data"][0]["data"]["disagree_claimant_notice_reason"]).to eql @claimant.disagree_claimant_notice_reason
          expect(request_body["data"][0]["data"]["agree_with_claimant_pension_benefits"]).to eql false
          expect(request_body["data"][0]["data"]["disagree_claimant_pension_benefits_reason"]).to eql @claimant.disagree_claimant_pension_benefits_reason
          expect(request_body["data"][0]["data"]["defend_claim"]).to eql true
          expect(request_body["data"][0]["data"]["defend_claim_facts"]).to eql @claimant.defend_claim_facts
          expect(request_body["data"][0]["data"]["make_employer_contract_claim"]).to eql true
          expect(request_body["data"][0]["data"]["claim_information"]).to eql @respondent.claim_information
          expect(file_upload_keys).to include request_body["data"][0]["data"]["additional_information_key"]
          expect(request_body["data"][0]["data"]["email_receipt"]).to eql ""
          expect(request_body["data"][0]["data"]["pdf_template_reference"]).to eql "et3-v1-#{::ET3::Test::Messaging.instance.current_locale}"
          expect(request_body["data"][0]["data"]["email_template_reference"]).to eql "et3-v1-#{::ET3::Test::Messaging.instance.current_locale}"
          expect(request_body["data"][0]["uuid"]).to be_an_instance_of(String)
          expect(request_body["data"][1]["command"]).to eql "BuildRespondent"
          expect(request_body["data"][1]["data"]["name"]).to eql @respondent.name
          expect(request_body["data"][1]["data"]["contact"]).to eql @respondent.contact
          expect(request_body["data"][1]["data"]["address_attributes"]["building"]).to eql @respondent.building_name
          expect(request_body["data"][1]["data"]["address_attributes"]["street"]).to eql @respondent.street_name
          expect(request_body["data"][1]["data"]["address_attributes"]["locality"]).to eql @respondent.town
          expect(request_body["data"][1]["data"]["address_attributes"]["county"]).to eql @respondent.county
          expect(request_body["data"][1]["data"]["address_attributes"]["post_code"]).to eql @respondent.postcode
          expect(request_body["data"][1]["data"]["dx_number"]).to eql @respondent.dx_number
          expect(request_body["data"][1]["data"]["address_telephone_number"]).to eql @respondent.contact_number
          expect(request_body["data"][1]["data"]["alt_phone_number"]).to eql @respondent.contact_mobile_number
          expect(request_body["data"][1]["data"]["contact_preference"]).to eql @respondent.contact_preference.to_s.split('.')[-2]
          expect(request_body["data"][1]["data"]["email_address"]).to eql @respondent.email_address if @respondent.contact_preference == 'email'
          expect(request_body["data"][1]["data"]["fax_number"]).to eql @respondent.fax_number if @respondent.contact_preference == 'fax'
          expect(request_body["data"][1]["data"]["organisation_employ_gb"].to_s).to eql @respondent.organisation_employ_gb
          expect(request_body["data"][1]["data"]["organisation_more_than_one_site"]).to eql false
          expect(request_body["data"][1]["data"]["employment_at_site_number"]).to eql @respondent.employment_at_site_number
          expect(request_body["data"][1]["data"]["disability"]).to eql true
          expect(request_body["data"][1]["data"]["disability_information"]).to eql @respondent.disability_information
          expect(request_body["data"][1]["uuid"]).to be_an_instance_of(String)
          expect(request_body["data"][2]["command"]).to eql "BuildRepresentative"
          expect(request_body["data"][2]["data"]["name"]).to eql @representative.name
          expect(request_body["data"][2]["data"]["organisation_name"]).to eql @representative.organisation_name
          expect(request_body["data"][2]["data"]["address_attributes"]["building"]).to eql @representative.building
          expect(request_body["data"][2]["data"]["address_attributes"]["street"]).to eql @representative.street
          expect(request_body["data"][2]["data"]["address_attributes"]["locality"]).to eql @representative.locality
          expect(request_body["data"][2]["data"]["address_attributes"]["county"]).to eql @representative.county
          expect(request_body["data"][2]["data"]["address_attributes"]["post_code"]).to eql @representative.post_code
          expect(request_body["data"][2]["data"]["address_telephone_number"]).to eql @representative.telephone_number
          expect(request_body["data"][2]["data"]["mobile_number"]).to eql @representative.representative_mobile
          expect(request_body["data"][2]["data"]["representative_type"]).to eql @representative.type.to_s.split('.')[-2].capitalize
          expect(request_body["data"][2]["data"]["dx_number"]).to eql @representative.dx_number
          expect(request_body["data"][2]["data"]["reference"]).to eql @representative.representative_reference
          expect(request_body["data"][2]["data"]["contact_preference"]).to eql @representative.representative_contact_preference.to_s.split('.')[-2]
          expect(request_body["data"][2]["data"]["email_address"]).to eql nil
          expect(request_body["data"][2]["data"]["fax_number"]).to eql @representative.representative_fax
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
    given_valid_data

    start_a_new_et3_response
    answer_respondents_details
    answer_claimants_details
    answer_earnings_and_benefits
    answer_defend_claim_question
    answer_representative
    answer_disability_question
    answer_employers_contract_claim
    answer_additional_information
    answer_confirmation_of_supplied_details

    respondents_details_page.load(locale: current_locale_parameter)

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
    expect(respondents_details_page.contact_preference_question.post.has_checked_field?).to be false
    expect(respondents_details_page.contact_preference_question.fax.has_checked_field?).to be false
    expect(respondents_details_page.contact_preference_question.preference_fax.value).to eql ""
    expect(respondents_details_page.organisation_employ_gb_question.field.value).to eql ""
    respondents_details_page.organisation_more_than_one_site_question.assert_selector(:field, nil, checked: false)
    expect(respondents_details_page.organisation_more_than_one_site_question.employment_at_site_number.value).to eql ""
  end

  scenario "correctly followed by removing the uploaded file will not submit it to the API" do
    given_valid_data

    start_a_new_et3_response
    answer_respondents_details
    answer_claimants_details
    answer_earnings_and_benefits
    answer_defend_claim_question
    answer_representative
    answer_disability_question
    answer_employers_contract_claim
    answer_additional_information

    confirmation_of_supplied_details_page.confirmation_of_additional_information_answers.upload_additional_information_row.remove_file_link.click
    confirmation_of_supplied_details_page.submit_form

    expect(a_request(:post, "http://api.et.127.0.0.1.nip.io:3100/api/v2/respondents/build_response").
        with { |request|
          request_body = JSON.parse(request.body)
          expect(request_body["data"][0]["data"]["additional_information_key"]).to be nil
        }).to have_been_made.once
  end
end

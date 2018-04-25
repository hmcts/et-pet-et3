require 'rails_helper'
RSpec.feature "Fill in whole form", js: true do

  before do
    stub_et_api
  end

  scenario "correctly will flow without error" do

    given_i_am(:company01)

    answer_all_questions

    # Check respondent's details table
    expect(confirmation_of_supplied_details_page).to have_confirmation_of_respondents_details_answers

    respondents_details_table = confirmation_of_supplied_details_page.confirmation_of_respondents_details_answers
    expect(respondents_details_table.case_number_row.case_number_answer).to have_text "7654321/2017"
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
    expect(claimants_details_table.continued_employment_row.continued_employment_answer).to have_text true
    expect(claimants_details_table.agree_with_claimants_description_of_job_or_title_row.agree_with_claimants_description_of_job_or_title_answer).to have_text false
    expect(claimants_details_table.disagree_claimants_job_or_title_row.disagree_claimants_job_or_title_answer).to have_text "lorem ipsum job title"

    # Check Earnings and Benefits Table
    expect(confirmation_of_supplied_details_page).to have_confirmation_of_earnings_and_benefits_answers

    earnings_and_benefits_table = confirmation_of_supplied_details_page.confirmation_of_earnings_and_benefits_answers
    expect(earnings_and_benefits_table.agree_with_claimants_hours_row.agree_with_claimants_hours_answer).to have_text false
    expect(earnings_and_benefits_table.queried_hours_row.queried_hours_answer).to have_text "32"
    expect(earnings_and_benefits_table.agree_with_earnings_details_row.agree_with_earnings_details_answer).to have_text false
    expect(earnings_and_benefits_table.queried_pay_before_tax_row.queried_pay_before_tax_answer).to have_text "1000"
    expect(earnings_and_benefits_table.queried_pay_before_tax_period_row.queried_pay_before_tax_period_answer).to have_text "Monthly"
    expect(earnings_and_benefits_table.queried_take_home_pay_row.queried_take_home_pay_answer).to have_text "900"
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
    expect(your_rep_details_table.representative_disability_row.representative_disability_answer).to have_text true
    expect(your_rep_details_table.disability_information_row.disability_information_answer).to have_text "Lorem ipsum disability"

    # Check Employer Contract Claim Table
    expect(confirmation_of_supplied_details_page).to have_confirmation_of_employer_contract_claim_answers

    employer_contract_claim_table = confirmation_of_supplied_details_page.confirmation_of_employer_contract_claim_answers
    expect(employer_contract_claim_table.make_employer_contract_claim_row.make_employer_contract_claim_answer).to have_text true
    expect(employer_contract_claim_table.claim_information_row.claim_information_answer).to have_text "lorem ipsum info"
    expect(employer_contract_claim_table.upload_additional_information_row.upload_additional_information_answer).to have_text "sample.rtf"

    confirmation_of_supplied_details_page.submit_form
    expect(form_submission_page).to be_displayed
    expect(a_request(:post, "https://et-api-example.com/v2/repondents/response").
      with(
        body: {
          "case_number": "7654321/2017",
          "name": "dodgy_co",
          "contact": "John Smith",
          "building_name": "the_shard",
          "street_name": "downing_street",
          "town": "westminster",
          "county": "",
          "postcode": "wc1 1aa",
          "dx_number": "",
          "contact_number": "",
          "mobile_number": "",
          "contact_preference": "email",
          "email_address": "john@dodgyco.com",
          "fax_number": "",
          "organisation_employ_gb": nil,
          "organisation_more_than_one_site": false,
          "employment_at_site_number": nil,
          "claimants_name": "Jane Doe",
          "agree_with_early_conciliation_details": false,
          "disagree_conciliation_reason": "lorem ipsum conciliation",
          "agree_with_employment_dates": false,
          "employment_start": "2017-01-01",
          "employment_end": "2017-12-31",
          "disagree_employment": "lorem ipsum employment",
          "continued_employment": true,
          "agree_with_claimants_description_of_job_or_title": false,
          "disagree_claimants_job_or_title": "lorem ipsum job title",
          "agree_with_claimants_hours": false,
          "queried_hours": 32.0,
          "agree_with_earnings_details": false,
          "queried_pay_before_tax": 1000.0,
          "queried_pay_before_tax_period": "Monthly",
          "queried_take_home_pay": 900.0,
          "queried_take_home_pay_period": "Monthly",
          "agree_with_claimant_notice": false,
          "disagree_claimant_notice_reason": "lorem ipsum notice reason",
          "agree_with_claimant_pension_benefits": false,
          "disagree_claimant_pension_benefits_reason": "lorem ipsum claimant pension",
          "defend_claim": true,
          "defend_claim_facts": "lorem ipsum defence",
          "have_representative": true,
          "type_of_representative": "Private Individual",
          "representative_org_name": "repco ltd",
          "representative_name": "Jane Doe",
          "representative_building": "Rep Building",
          "representative_street": "Rep Street",
          "representative_town": "Rep Town",
          "representative_county": "Rep County",
          "representative_postcode": "WC2 2BB",
          "representative_phone": "0207 987 6543",
          "representative_mobile": "07987654321",
          "representative_dx_number": "dx address",
          "representative_reference": "Rep Ref",
          "representative_contact_preference": "fax",
          "representative_email": "",
          "representative_fax": "0207 345 6789",
          "representative_disability": true,
          "representative_disability_information": "Lorem ipsum disability",
          "make_employer_contract_claim": true,
          "claim_information": "lorem ipsum info",
          "upload_additional_information": "sample.rtf",
          "email_receipt": "email@recei.pt",
          "confirm_email_receipt": "email@recei.pt"
        }.to_json,
        headers: { content_type: 'application/json', 'Accept': 'application/json' }
      )).to have_been_made.once

    expect(form_submission_page).to have_submission_confirmation
    expect(form_submission_page.reference_number).to have_text "992000000100"
    expect(form_submission_page.submission_date).to have_text "13/01/2018 14:00"
    expect(form_submission_page).to have_download_pdf

  end
end

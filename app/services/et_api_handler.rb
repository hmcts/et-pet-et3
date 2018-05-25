require 'httparty'

class EtApiHandler

  def self.submit(form_hash)
    http_response = HTTParty.post("#{ENV.fetch('ET_API_URL', 'https://et-api-example.com')}/v2/respondents/build_response",
      body: {
        "uuid": SecureRandom.uuid,
        "command": "SerialSequence",
        "data": [
          {
            "command": "BuildResponse",
            "data": {
              "case_number": form_hash[:respondents_detail_answers][:case_number],
              "claimants_name": form_hash[:claimants_detail_answers][:claimants_name],
              "agree_with_early_conciliation_details": form_hash[:claimants_detail_answers][:agree_with_early_conciliation_details],
              "disagree_conciliation_reason": form_hash[:claimants_detail_answers][:disagree_conciliation_reason],
              "agree_with_employment_dates": form_hash[:claimants_detail_answers][:agree_with_employment_dates],
              "employment_start": form_hash[:claimants_detail_answers][:employment_start],
              "employment_end": form_hash[:claimants_detail_answers][:employment_end],
              "disagree_employment": form_hash[:claimants_detail_answers][:disagree_employment],
              "continued_employment": form_hash[:claimants_detail_answers][:continued_employment],
              "agree_with_claimants_description_of_job_or_title": form_hash[:claimants_detail_answers][:agree_with_claimants_description_of_job_or_title],
              "disagree_claimants_job_or_title": form_hash[:claimants_detail_answers][:disagree_claimants_job_or_title],
              "agree_with_claimants_hours": form_hash[:earnings_and_benefits_answers][:agree_with_claimants_hours],
              "queried_hours": form_hash[:earnings_and_benefits_answers][:queried_hours],
              "agree_with_earnings_details": form_hash[:earnings_and_benefits_answers][:agree_with_earnings_details],
              "queried_pay_before_tax": form_hash[:earnings_and_benefits_answers][:queried_pay_before_tax],
              "queried_pay_before_tax_period": form_hash[:earnings_and_benefits_answers][:queried_pay_before_tax_period],
              "queried_take_home_pay": form_hash[:earnings_and_benefits_answers][:queried_take_home_pay],
              "queried_take_home_pay_period": form_hash[:earnings_and_benefits_answers][:queried_take_home_pay_period],
              "agree_with_claimant_notice": form_hash[:earnings_and_benefits_answers][:agree_with_claimant_notice],
              "disagree_claimant_notice_reason": form_hash[:earnings_and_benefits_answers][:disagree_claimant_notice_reason],
              "agree_with_claimant_pension_benefits": form_hash[:earnings_and_benefits_answers][:agree_with_claimant_pension_benefits],
              "disagree_claimant_pension_benefits_reason": form_hash[:earnings_and_benefits_answers][:disagree_claimant_pension_benefits_reason],
              "defend_claim": form_hash[:response_answers][:defend_claim],
              "defend_claim_facts": form_hash[:response_answers][:defend_claim_facts],
              "make_employer_contract_claim": form_hash[:employer_contract_claim_answers][:make_employer_contract_claim],
              "claim_information": form_hash[:employer_contract_claim_answers][:claim_information],
              "email_receipt": form_hash[:confirmation_of_supplied_details_answers][:email_receipt]
            },
            "uuid": SecureRandom.uuid
          },
          {
            "command": "BuildRespondent",
            "data": {
              "name": form_hash[:respondents_detail_answers][:name],
              "contact": form_hash[:respondents_detail_answers][:contact],
              "address_attributes": {
                "building": form_hash[:respondents_detail_answers][:building_name],
                "street": form_hash[:respondents_detail_answers][:street_name],
                "locality": form_hash[:respondents_detail_answers][:town],
                "county": form_hash[:respondents_detail_answers][:county],
                "post_code": form_hash[:respondents_detail_answers][:postcode]
              },
              "dx_number": form_hash[:respondents_detail_answers][:dx_number],
              "address_telephone_number": form_hash[:respondents_detail_answers][:contact_number],
              "alt_phone_number": form_hash[:respondents_detail_answers][:mobile_number],
              "contact_preference": form_hash[:respondents_detail_answers][:contact_preference],
              "email_address": form_hash[:respondents_detail_answers][:email_address],
              "fax_number": form_hash[:respondents_detail_answers][:fax_number],
              "organisation_employ_gb": form_hash[:respondents_detail_answers][:organisation_employ_gb],
              "organisation_more_than_one_site": form_hash[:respondents_detail_answers][:organisation_more_than_one_site],
              "employment_at_site_number": form_hash[:respondents_detail_answers][:employment_at_site_number]
            },
            "uuid": SecureRandom.uuid
          },
          {
            "command": "BuildRepresentative",
            "data": {
              "name": form_hash[:your_representatives_details_answers][:representative_name],
              "organisation_name": form_hash[:your_representatives_details_answers][:representative_org_name],
              "address_attributes": {
                "building": form_hash[:your_representatives_details_answers][:representative_building],
                "street": form_hash[:your_representatives_details_answers][:representative_street],
                "locality": form_hash[:your_representatives_details_answers][:representative_town],
                "county": form_hash[:your_representatives_details_answers][:representative_county],
                "post_code": form_hash[:your_representatives_details_answers][:representative_postcode]
              },
              "address_telephone_number": form_hash[:your_representatives_details_answers][:representative_phone],
              "mobile_number": form_hash[:your_representatives_details_answers][:representative_mobile],
              "representative_type": form_hash[:your_representatives_details_answers][:type_of_representative],
              "dx_number": form_hash[:your_representatives_details_answers][:representative_dx_number],
              "reference": form_hash[:your_representatives_details_answers][:representative_reference],
              "contact_preference": form_hash[:your_representatives_details_answers][:representative_contact_preference],
              "email_address": form_hash[:your_representatives_details_answers][:representative_email],
              "fax_number": form_hash[:your_representatives_details_answers][:representative_fax],
              "disability": form_hash[:your_representatives_details_answers][:representative_disability],
              "disability_information": form_hash[:your_representatives_details_answers][:representative_disability_information]
            },
            "uuid": SecureRandom.uuid
          }
        ]
      }.to_json,
      headers: { 'Accept': 'application/json', 'Content-Type': 'application/json' })
      headers: { content_type: 'application/json', 'Accept': 'application/json' })
    http_response.parsed_response
  end
end

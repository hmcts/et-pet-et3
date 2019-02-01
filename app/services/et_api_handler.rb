require 'httparty'

class EtApiHandler

  def self.submit(form_hash)

    data_array = [build_response_data(form_hash), build_respondent_data(form_hash)]
    data_array.push(build_representative_data(form_hash)) if form_hash[:your_representative_answers][:have_representative]

    http_response = HTTParty.post("#{ENV.fetch('ET_API_URL', 'http://api.et.127.0.0.1.nip.io:3100/api')}/v2/respondents/build_response",
      body: {
        "uuid": SecureRandom.uuid,
        "command": "SerialSequence",
        "data": data_array
      }.to_json,
      headers: { 'Accept': 'application/json', 'Content-Type': 'application/json' })

    { data: http_response.parsed_response, status: http_response.code }
  end

  def self.validate_response(attribute, value)
    response = HTTParty.
               post("#{ENV.fetch('ET_API_URL', 'http://api.et.127.0.0.1.nip.io:3100/api')}/v2/validate_response",
                 body: {
                   "#{attribute}": value
                 }.to_json,
                 headers: { 'Accept': 'application/json', 'Content-Type': 'application/json' })

    parse_validator_response(response)
  end

  private

  def self.build_response_data(full_hash)
    {
      "command": "BuildResponse",
      "data": {
        "case_number": full_hash[:respondents_detail_answers][:case_number],
        "claimants_name": full_hash[:claimants_detail_answers][:claimants_name],
        "agree_with_early_conciliation_details": full_hash[:claimants_detail_answers][:agree_with_early_conciliation_details],
        "disagree_conciliation_reason": full_hash[:claimants_detail_answers][:disagree_conciliation_reason],
        "agree_with_employment_dates": full_hash[:claimants_detail_answers][:agree_with_employment_dates],
        "employment_start": full_hash[:claimants_detail_answers][:employment_start],
        "employment_end": full_hash[:claimants_detail_answers][:employment_end],
        "disagree_employment": full_hash[:claimants_detail_answers][:disagree_employment],
        "continued_employment": full_hash[:claimants_detail_answers][:continued_employment],
        "agree_with_claimants_description_of_job_or_title": full_hash[:claimants_detail_answers][:agree_with_claimants_description_of_job_or_title],
        "disagree_claimants_job_or_title": full_hash[:claimants_detail_answers][:disagree_claimants_job_or_title],
        "agree_with_claimants_hours": full_hash[:earnings_and_benefits_answers][:agree_with_claimants_hours],
        "queried_hours": full_hash[:earnings_and_benefits_answers][:queried_hours],
        "agree_with_earnings_details": full_hash[:earnings_and_benefits_answers][:agree_with_earnings_details],
        "queried_pay_before_tax": full_hash[:earnings_and_benefits_answers][:queried_pay_before_tax],
        "queried_pay_before_tax_period": full_hash[:earnings_and_benefits_answers][:queried_pay_before_tax_period],
        "queried_take_home_pay": full_hash[:earnings_and_benefits_answers][:queried_take_home_pay],
        "queried_take_home_pay_period": full_hash[:earnings_and_benefits_answers][:queried_take_home_pay_period],
        "agree_with_claimant_notice": full_hash[:earnings_and_benefits_answers][:agree_with_claimant_notice],
        "disagree_claimant_notice_reason": full_hash[:earnings_and_benefits_answers][:disagree_claimant_notice_reason],
        "agree_with_claimant_pension_benefits": full_hash[:earnings_and_benefits_answers][:agree_with_claimant_pension_benefits],
        "disagree_claimant_pension_benefits_reason": full_hash[:earnings_and_benefits_answers][:disagree_claimant_pension_benefits_reason],
        "defend_claim": full_hash[:response_answers][:defend_claim],
        "defend_claim_facts": full_hash[:response_answers][:defend_claim_facts],
        "make_employer_contract_claim": full_hash[:employer_contract_claim_answers][:make_employer_contract_claim],
        "claim_information": full_hash[:employer_contract_claim_answers][:claim_information],
        "additional_information_key": (full_hash[:additional_information_answers][:upload_additional_information] == "" ? nil : full_hash[:additional_information_answers][:upload_additional_information]),
        "email_receipt": full_hash[:confirmation_of_supplied_details_answers][:email_receipt],
        "pdf_template_reference": "et3-v1-#{I18n.locale}",
        "email_template_reference": "et3-v1-#{I18n.locale}"
      },
      "uuid": SecureRandom.uuid
    }
  end

  def self.build_respondent_data(full_hash)
    respondent_hash = {
      "command": "BuildRespondent",
      "data": {
        "name": full_hash[:respondents_detail_answers][:name],
        "contact": full_hash[:respondents_detail_answers][:contact],
        "address_attributes": {
          "building": full_hash[:respondents_detail_answers][:building_name],
          "street": full_hash[:respondents_detail_answers][:street_name],
          "locality": full_hash[:respondents_detail_answers][:town],
          "county": full_hash[:respondents_detail_answers][:county],
          "post_code": full_hash[:respondents_detail_answers][:postcode]
        },
        "dx_number": full_hash[:respondents_detail_answers][:dx_number],
        "address_telephone_number": full_hash[:respondents_detail_answers][:contact_number],
        "alt_phone_number": full_hash[:respondents_detail_answers][:mobile_number],
        "contact_preference": full_hash[:respondents_detail_answers][:contact_preference],
        "email_address": full_hash[:respondents_detail_answers][:email_address],
        "fax_number": full_hash[:respondents_detail_answers][:fax_number],
        "organisation_employ_gb": full_hash[:respondents_detail_answers][:organisation_employ_gb],
        "organisation_more_than_one_site": full_hash[:respondents_detail_answers][:organisation_more_than_one_site],
        "employment_at_site_number": full_hash[:respondents_detail_answers][:employment_at_site_number]
      },
      "uuid": SecureRandom.uuid
    }

    respondent_hash[:data] = respondent_hash[:data].merge(build_disability_data(full_hash)) if full_hash[:disability_answers][:disability]
    respondent_hash
  end

  def self.build_representative_data(full_hash)
    {
      "command": "BuildRepresentative",
      "data": {
        "name": full_hash[:your_representatives_details_answers][:representative_name],
        "organisation_name": full_hash[:your_representatives_details_answers][:representative_org_name],
        "address_attributes": {
          "building": full_hash[:your_representatives_details_answers][:representative_building],
          "street": full_hash[:your_representatives_details_answers][:representative_street],
          "locality": full_hash[:your_representatives_details_answers][:representative_town],
          "county": full_hash[:your_representatives_details_answers][:representative_county],
          "post_code": full_hash[:your_representatives_details_answers][:representative_postcode]
        },
        "address_telephone_number": full_hash[:your_representatives_details_answers][:representative_phone],
        "mobile_number": full_hash[:your_representatives_details_answers][:representative_mobile],
        "representative_type": full_hash[:your_representatives_details_answers][:type_of_representative],
        "dx_number": full_hash[:your_representatives_details_answers][:representative_dx_number],
        "reference": full_hash[:your_representatives_details_answers][:representative_reference],
        "contact_preference": full_hash[:your_representatives_details_answers][:representative_contact_preference],
        "email_address": full_hash[:your_representatives_details_answers][:representative_email],
        "fax_number": full_hash[:your_representatives_details_answers][:representative_fax]
      },
      "uuid": SecureRandom.uuid
    }
  end

  def self.build_disability_data(full_hash)
    {
      "disability": full_hash[:disability_answers][:disability],
      "disability_information": full_hash[:disability_answers][:disability_information]
    }
  end

  def self.parse_validator_response(response)
    response["status"] == "not_accepted" ? response["errors"].first["code"] : true
  end
end

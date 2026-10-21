require 'httparty'

class EtApiHandler
  include ActiveModel::Model
  class SubmitError < StandardError; end

  attr_reader :response

  def self.submit(form_hash)
    new.submit(form_hash)
  end

  def self.validate_additional_information_file(record, attribute, value,
    validate_additional_information_file_service: ValidateAdditionalInformationFileViaApiService)
    validate_additional_information_file_service.call(record, attribute, value)
  end

  # Submits the form data to the ET API and returns the response.
  #
  # @param form_hash [Hash] The form data to be submitted.
  # @return [EtApiHandler] Returns itself - with the .response method used to get the response from the ET API, including status code and data.
  # @raise [SubmitError] If there is an error during submission.
  def submit(form_hash)
    data_array = [build_response_data(form_hash), build_respondent_data(form_hash)]
    data_array.push(build_representative_data(form_hash)) if form_hash.dig(:your_representative_answers, :have_representative)

    http_response = HTTParty.post("#{ENV.fetch('ET_API_URL', 'http://api.localhost:3100/api/v2')}/respondents/build_response",
                                  body: {
                                    uuid: SecureRandom.uuid,
                                    command: "SerialSequence",
                                    data: data_array
                                  }.to_json,
                                  headers: { Accept: 'application/json', 'Content-Type': 'application/json' })

    raise SubmitError, "Failed to submit form data - Client Error: #{http_response.code}" if http_response.code.in?(500..599)

    add_errors_from_response(http_response)
    return self unless valid?

    @response = { data: http_response.parsed_response, status: http_response.code }
    self
  rescue HTTParty::Error, SocketError, Errno::ECONNREFUSED, Errno::ECONNRESET, Errno::ETIMEDOUT, Timeout::Error, OpenSSL::SSL::SSLError => e
    raise SubmitError, "Failed to submit form data: #{e.message}", cause: e
  end

  def valid?
    errors.empty?
  end

  private

  def add_errors_from_response(http_response)
    return if http_response.code.in?(200..299)

    case http_response.code
    when 400
      add_errors_from_response_data(http_response.parsed_response)
    else
      errors.add(:base, 'invalid_response', message: "Invalid response from API")
    end
  end

  def add_errors_from_response_data(response_data)
    case response_data['status']
    when 'not_accepted'
      add_error_details(response_data['errors'])
    else
      errors.add(:base, 'invalid_response', message: "Invalid response from API")
    end
  end

  def add_error_details(response_errors)
    response_errors.each do |response_error|
      errors.add(convert_error_source(response_error['source']), response_error['code'], message: response_error['detail'])
    end
  end

  def convert_error_source(error_source)
    (_, idx, *remainder) = error_source.split('/').compact_blank
    sources = [:BuildResponse, :BuildRespondent, :BuildRepresentative]
    section = find_answers_section(sources[idx.to_i], remainder)
    ([section] + remainder).join('/')
  end

  def find_answers_section(command_name, attribute_path)
    root = ERROR_SOURCES[command_name]
    root.find do |k, v|
      v.include?(attribute_path.first.to_sym)
    end&.first
  end

  ERROR_SOURCES = {
    BuildResponse: {
      respondents_detail_answers: [:case_number],
      claimants_detail_answers: [
        :claimants_name,
        :agree_with_early_conciliation_details,
        :disagree_conciliation_reason,
        :agree_with_employment_dates,
        :employment_start,
        :employment_end,
        :disagree_employment,
        :continued_employment,
        :agree_with_claimants_description_of_job_or_title,
        :disagree_claimants_job_or_title
      ],
      earnings_and_benefits_answers: [
        :agree_with_claimants_hours,
        :queried_hours,
        :agree_with_earnings_details,
        :queried_pay_before_tax,
        :queried_pay_before_tax_period,
        :queried_take_home_pay,
        :queried_take_home_pay_period,
        :agree_with_claimant_notice,
        :disagree_claimant_notice_reason,
        :agree_with_claimant_pension_benefits,
        :disagree_claimant_pension_benefits_reason,
      ],
      response_answers: [
        :defend_claim,
        :defend_claim_facts
      ],
      employer_contract_claim_answers: [
        :make_employer_contract_claim,
        :claim_information
      ],
      additional_information_answers: [
        :additional_information_key
      ],
      confirmation_of_supplied_details_answers: [
        :email_receipt
      ],
      case_heard_by_answers: [
        :case_heard_by_preference,
        :case_heard_by_preference_reason
      ]
    },
    BuildRespondent: {
      respondents_detail_answers: [
        :name,
        :company_number,
        :type_of_employer,
        :title,
        :contact,
        :dx_number,
        :address_telephone_number,
        :alt_phone_number,
        :contact_preference,
        :email_address,
        :organisation_employ_gb,
        :organisation_more_than_one_site,
        :employment_at_site_number,
        :allow_video_attendance,
        :allow_phone_attendance,
        :address_attributes

      ]
    },
    BuildRepresentative: {
      your_representatives_details_answers: [
        :name,
        :organisation_name,
        :address_telephone_number,
        :mobile_number,
        :representative_type,
        :dx_number,
        :reference,
        :contact_preference,
        :email_address,
        :allow_video_attendance,
        :allow_phone_attendance,
        :address_attributes
      ]
    }

  }.freeze

  def build_response_data(full_hash)
    {
      command: "BuildResponse",
      data: {
        case_number: full_hash.dig(:respondents_detail_answers, :case_number),
        claimants_name: full_hash.dig(:claimants_detail_answers, :claimants_name),
        agree_with_early_conciliation_details: full_hash.dig(:claimants_detail_answers, :agree_with_early_conciliation_details),
        disagree_conciliation_reason: full_hash.dig(:claimants_detail_answers, :disagree_conciliation_reason),
        agree_with_employment_dates: full_hash.dig(:claimants_detail_answers, :agree_with_employment_dates),
        employment_start: full_hash.dig(:claimants_detail_answers, :employment_start),
        employment_end: full_hash.dig(:claimants_detail_answers, :employment_end),
        disagree_employment: full_hash.dig(:claimants_detail_answers, :disagree_employment),
        continued_employment: full_hash.dig(:claimants_detail_answers, :continued_employment),
        agree_with_claimants_description_of_job_or_title: full_hash.dig(:claimants_detail_answers, :agree_with_claimants_description_of_job_or_title),
        disagree_claimants_job_or_title: full_hash.dig(:claimants_detail_answers, :disagree_claimants_job_or_title),
        agree_with_claimants_hours: full_hash.dig(:earnings_and_benefits_answers, :agree_with_claimants_hours),
        queried_hours: full_hash.dig(:earnings_and_benefits_answers, :queried_hours),
        agree_with_earnings_details: full_hash.dig(:earnings_and_benefits_answers, :agree_with_earnings_details),
        queried_pay_before_tax: full_hash.dig(:earnings_and_benefits_answers, :queried_pay_before_tax),
        queried_pay_before_tax_period: full_hash.dig(:earnings_and_benefits_answers, :queried_pay_before_tax_period),
        queried_take_home_pay: full_hash.dig(:earnings_and_benefits_answers, :queried_take_home_pay),
        queried_take_home_pay_period: full_hash.dig(:earnings_and_benefits_answers, :queried_take_home_pay_period),
        agree_with_claimant_notice: full_hash.dig(:earnings_and_benefits_answers, :agree_with_claimant_notice),
        disagree_claimant_notice_reason: full_hash.dig(:earnings_and_benefits_answers, :disagree_claimant_notice_reason),
        agree_with_claimant_pension_benefits: full_hash.dig(:earnings_and_benefits_answers, :agree_with_claimant_pension_benefits),
        disagree_claimant_pension_benefits_reason: full_hash.dig(:earnings_and_benefits_answers, :disagree_claimant_pension_benefits_reason),
        defend_claim: full_hash.dig(:response_answers, :defend_claim),
        defend_claim_facts: full_hash.dig(:response_answers, :defend_claim_facts),
        make_employer_contract_claim: full_hash.dig(:employer_contract_claim_answers, :make_employer_contract_claim),
        claim_information: full_hash.dig(:employer_contract_claim_answers, :claim_information),
        additional_information_key: (full_hash.dig(:additional_information_answers, :upload_additional_information).blank? ? nil : full_hash.dig(:additional_information_answers, :upload_additional_information, :path)),
        email_receipt: full_hash.dig(:confirmation_of_supplied_details_answers, :email_receipt),
        case_heard_by_preference: full_hash.dig(:case_heard_by_answers, :case_heard_by_preference),
        case_heard_by_preference_reason: full_hash.dig(:case_heard_by_answers, :case_heard_by_preference_reason),
        pdf_template_reference: "et3-v4-#{I18n.locale}",
        email_template_reference: "et3-v1-#{I18n.locale}"
      },
      uuid: SecureRandom.uuid
    }
  end

  def build_respondent_data(full_hash)
    respondent_hash = {
      command: "BuildRespondent",
      data: {
        name: full_hash.dig(:respondents_detail_answers, :name),
        company_number: full_hash.dig(:respondents_detail_answers, :company_number),
        type_of_employer: full_hash.dig(:respondents_detail_answers, :type_of_employer).then { |v| v.blank? ? v : I18n.t("respondents_details.edit.type_of_employer.options.#{v}", locale: :en) },
        title: full_hash.dig(:respondents_detail_answers, :title) == 'Other' ? full_hash.dig(:respondents_detail_answers, :other_title) : full_hash.dig(:respondents_detail_answers, :title),
        contact: full_hash.dig(:respondents_detail_answers, :contact),
        address_attributes: {
          building: full_hash.dig(:respondents_detail_answers, :building_name),
          street: full_hash.dig(:respondents_detail_answers, :street_name),
          locality: full_hash.dig(:respondents_detail_answers, :town),
          county: full_hash.dig(:respondents_detail_answers, :county),
          post_code: full_hash.dig(:respondents_detail_answers, :postcode)
        },
        dx_number: full_hash.dig(:respondents_detail_answers, :dx_number),
        address_telephone_number: full_hash.dig(:respondents_detail_answers, :contact_number),
        alt_phone_number: full_hash.dig(:respondents_detail_answers, :mobile_number),
        contact_preference: full_hash.dig(:respondents_detail_answers, :contact_preference),
        email_address: full_hash.dig(:respondents_detail_answers, :email_address),
        organisation_employ_gb: full_hash.dig(:respondents_detail_answers, :organisation_employ_gb),
        organisation_more_than_one_site: full_hash.dig(:respondents_detail_answers, :organisation_more_than_one_site),
        employment_at_site_number: full_hash.dig(:respondents_detail_answers, :employment_at_site_number),
        allow_video_attendance: full_hash.dig(:respondents_detail_answers, :allow_phone_or_video_attendance)&.include?('video'),
        allow_phone_attendance: full_hash.dig(:respondents_detail_answers, :allow_phone_or_video_attendance)&.include?('phone')
      },
      uuid: SecureRandom.uuid
    }

    respondent_hash[:data] = respondent_hash[:data].merge(build_disability_data(full_hash)) if full_hash.dig(:disability_answers, :disability)
    respondent_hash
  end

  def build_representative_data(full_hash)
    {
      command: "BuildRepresentative",
      data: {
        name: full_hash.dig(:your_representatives_details_answers, :representative_name),
        organisation_name: full_hash.dig(:your_representatives_details_answers, :representative_org_name),
        address_attributes: {
          building: full_hash.dig(:your_representatives_details_answers, :representative_building),
          street: full_hash.dig(:your_representatives_details_answers, :representative_street),
          locality: full_hash.dig(:your_representatives_details_answers, :representative_town),
          county: full_hash.dig(:your_representatives_details_answers, :representative_county),
          post_code: full_hash.dig(:your_representatives_details_answers, :representative_postcode)
        },
        address_telephone_number: full_hash.dig(:your_representatives_details_answers, :representative_phone),
        mobile_number: full_hash.dig(:your_representatives_details_answers, :representative_mobile),
        representative_type: full_hash.dig(:your_representatives_details_answers, :type_of_representative),
        dx_number: full_hash.dig(:your_representatives_details_answers, :representative_dx_number),
        reference: full_hash.dig(:your_representatives_details_answers, :representative_reference),
        contact_preference: full_hash.dig(:your_representatives_details_answers, :representative_contact_preference),
        email_address: full_hash.dig(:your_representatives_details_answers, :representative_email),
        allow_video_attendance: full_hash.dig(:your_representatives_details_answers, :allow_phone_or_video_attendance)&.include?('video'),
        allow_phone_attendance: full_hash.dig(:your_representatives_details_answers, :allow_phone_or_video_attendance)&.include?('phone')
      },
      uuid: SecureRandom.uuid
    }
  end

  def build_disability_data(full_hash)
    {
      disability: full_hash.dig(:disability_answers, :disability),
      disability_information: full_hash.dig(:disability_answers, :disability_information)
    }
  end
end

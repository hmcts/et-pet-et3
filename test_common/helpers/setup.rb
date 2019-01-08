module ET3
  module Test
    module Setup
      attr_accessor :user

      def given_valid_data
        @claimant = FactoryBot.create(:claimant, :claimant_valid)
        @respondent = FactoryBot.create(:respondent, :respondent_valid, :upload_additional_information)
        @representative = FactoryBot.create(:representative, :representative_valid) 
      end

      def given_invalid_data
        @claimant = FactoryBot.create(:claimant, :claimant_invalid)
        @respondent = FactoryBot.create(:respondent, :respondent_invalid, case_number: '9954321xxx')
        @representative = FactoryBot.create(:representative, :representative_invalid)
      end

      def start_a_new_et3_response
        start_page.load(locale: current_locale_parameter)
        start_page.next
      end

      # Respondent's Details Page
      def answer_respondents_details
        user = @respondent
        respondents_details_page.case_number_question.set(user.case_number)
        respondents_details_page.name_question.set(user.name)
        respondents_details_page.contact_question.set(user.contact)
        respondents_details_page.building_name_question.set(user.building_name)
        respondents_details_page.street_question.set(user.street_name)
        respondents_details_page.town_question.set(user.town)
        respondents_details_page.county_question.set(user.county)
        respondents_details_page.postcode_question.set(user.postcode)
        respondents_details_page.dx_number_question.set(user.dx_number)
        respondents_details_page.contact_number_question.set(user.contact_number)
        respondents_details_page.contact_mobile_number_question.set(user.contact_mobile_number)
        respondents_details_page.contact_preference_question.set_for(user)
        respondents_details_page.organisation_more_than_one_site_question.set_for(user)
        respondents_details_page.organisation_employ_gb_question.set(user.organisation_employ_gb)

        respondents_details_page.next
      end

      # Claimant's Details Page
      def answer_claimants_details
        user = @claimant
        claimants_details_page.claimants_name_question.set(user.claimants_name)
        claimants_details_page.agree_with_early_conciliation_details_question.set_for(user)
        claimants_details_page.agree_with_employment_dates_question.set_for(user)
        claimants_details_page.continued_employment_question.set_for(user.continued_employment)
        claimants_details_page.agree_with_claimants_description_of_job_or_title_question.set_for(user)
        claimants_details_page.next
      end

      # Earnings and Benefits Page
      def answer_earnings_and_benefits
        user = @claimant
        earnings_and_benefits_page.agree_with_claimants_hours_question.set_for(user)
        earnings_and_benefits_page.agree_with_earnings_details_question.set_for(user)
        earnings_and_benefits_page.agree_with_claimant_notice_question.set_for(user)
        earnings_and_benefits_page.agree_with_claimant_pension_benefits_question.set_for(user)

        earnings_and_benefits_page.next
      end

      # Response Page
      def answer_defend_claim_question
        user = @claimant
        response_page.defend_claim_question.set_for(user)

        response_page.next
      end

      # Your Representative Page
      def answer_representative
        user = @representative
        if t(user.have_representative) == t('questions.have_representative.yes.label')
          your_representative_page.have_representative_question.set_for(user)
          your_representative_page.next
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
        else
          your_representative_page.next
        end
      end

      # Disability Page
      def answer_disability_question
        user = @respondent
        disability_page.disability_question.set_for(user)

        disability_page.next
      end

      # Employers Contract Claim Page
      def answer_employers_contract_claim
        user = @respondent
        employers_contract_claim_page.make_employer_contract_claim_question.set_for(user)

        employers_contract_claim_page.next
      end

      def displays_edited_answer
        make_employer_contract_claim_row.make_employer_contract_claim_answer.text
      end

      # Additional Information Page
      def answer_additional_information
        user = @respondent
        if user[:rtf_file]
          additional_information_page.attach_additional_information_file(user)
        end
        additional_information_page.next
      end

      # Confirmation of Supplied Details Page
      def answer_confirmation_of_supplied_details
        user = @respondent
        confirmation_of_supplied_details_page.email_receipt_question.set(user.email_receipt)
        confirmation_of_supplied_details_page.submit_form
      end

      def email_receipt_question
        user = @respondent
        confirmation_of_supplied_details_page.confirmation_of_employer_contract_claim_answers.edit_answers_link.click
      end

      # Stub Submission Calls to API
      def stub_et_api # rubocop:disable Metrics/MethodLength
        stub_request(:post, "#{ENV.fetch('ET_API_URL', 'http://api.et.127.0.0.1.nip.io:3100/api')}/v2/respondents/build_response").
          with(headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' }).
          to_return(
            headers: { 'Content-Type': 'application/json' },
            body:
              {
                "meta": {
                  "BuildResponse": {
                    "reference": "142000000100",
                    "submitted_at": "2018-01-13 14:00",
                    "pdf_url": "http://#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}/",
                    "office_address": "Alexandra House, 14-22 The Parsonage, Manchester, M3 2JA",
                    "office_phone_number": "0161 833 6100"
                  }
                }
              }.to_json,
            status: 202
          )
      end

      # Stub Submission Calls to API using Rack mounted PDF Download URL
      def stub_submission_with_custom_pdf_download_link # rubocop:disable Metrics/MethodLength
        stub_request(:post, "#{ENV.fetch('ET_API_URL', 'http://api.et.127.0.0.1.nip.io:3100/api')}/v2/respondents/build_response").
          with(headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' }).
          to_return(
            headers: { 'Content-Type': 'application/json' },
            body:
              {
                "meta": {
                  "BuildResponse": {
                    "reference": "142000000100",
                    "submitted_at": "2018-01-13 14:00",
                    "pdf_url": "http://#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}/test/pdf-download",
                    "office_address": "Alexandra House, 14-22 The Parsonage, Manchester, M3 2JA",
                    "office_phone_number": "0161 833 6100"
                  }
                }
              }.to_json,
            status: 202
          )
      end

      # Stub Calls to API for S3 URLs
      def stub_presigned_url_api_for_s3
        aws_response = Aws::S3::Bucket.new(client: configured_test_client, name: ENV.fetch('S3_DIRECT_UPLOAD_BUCKET', 'et3directbuckettest')).
                       presigned_post(key: "direct_uploads/#{SecureRandom.uuid}", success_action_status: '201')
        stub_request(:post, "#{ENV.fetch('ET_API_URL', 'http://api.et.127.0.0.1.nip.io:3100/api')}/v2/s3/create_signed_url").
          to_return(
            headers: { 'Content-Type': 'application/json' },
            body:
              {
                "data": {
                  "fields": aws_response.fields,
                  "url": aws_response.url
                },
                "status": "accepted",
                "uuid": SecureRandom.uuid
              }.to_json
          )
      end

    end
  end
end

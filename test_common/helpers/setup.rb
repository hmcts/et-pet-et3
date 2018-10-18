module ET3
  module Test
    module Setup

      attr_accessor :user

      def given_i_am(company_name)
        self.user = personas.fetch(company_name)
      end

      # Respondent's Details Page
      def answer_case_number_question
        respondents_details_page.case_number_question.set(user.case_number)
      end

      def answer_name_question
        respondents_details_page.name_question.set(user.name)
      end

      def answer_contact_question
        respondents_details_page.contact_question.set(user.contact)
      end

      def answer_building_name_question
        respondents_details_page.building_name_question.set(user.building_name)
      end

      def answer_street_question
        respondents_details_page.street_question.set(user.street_name)
      end

      def answer_town_question
        respondents_details_page.town_question.set(user.town)
      end

      def answer_county_question
        respondents_details_page.county_question.set(user.county)
      end

      def answer_postcode_question
        respondents_details_page.postcode_question.set(user.postcode)
      end

      def answer_dx_number_question
        respondents_details_page.dx_number_question.set(user.dx_number)
      end

      def answer_contact_number_question
        respondents_details_page.contact_number_question.set(user.contact_number)
      end

      def answer_contact_mobile_number_question
        respondents_details_page.contact_mobile_number_question.set(user.contact_mobile_number)
      end

      def answer_contact_preference_question
        respondents_details_page.contact_preference_question.set_for(user)
      end

      def answer_organisation_employ_gb_question
        respondents_details_page.organisation_employ_gb_question.set(user.organisation_employ_gb)
      end

      def answer_organisation_more_than_one_site_question
        respondents_details_page.organisation_more_than_one_site_question.set_for(user)
      end

      # Claimant's Details Page
      def answer_claimants_name_question
        claimants_details_page.claimants_name_question.set(user.claimants_name)
      end

      def answer_agree_with_early_conciliation_details_question
        claimants_details_page.agree_with_early_conciliation_details_question.set_for(user)
      end

      def answer_agree_with_employment_dates_question
        claimants_details_page.agree_with_employment_dates_question.set_for(user)
      end

      def answer_continued_employment_question
        claimants_details_page.continued_employment_question.set_for(user)
      end

      def answer_agree_with_claimants_description_of_job_or_title_question
        claimants_details_page.agree_with_claimants_description_of_job_or_title_question.set_for(user)
      end

      # Earnings and Benefits Page
      def answer_agree_with_claimants_hours_question
        earnings_and_benefits_page.agree_with_claimants_hours_question.set_for(user)
      end

      def answer_agree_with_earnings_details_question
        earnings_and_benefits_page.agree_with_earnings_details_question.set_for(user)
      end

      def answer_agree_with_claimant_notice_question
        earnings_and_benefits_page.agree_with_claimant_notice_question.set_for(user)
      end

      def answer_agree_with_claimant_pension_benefits_question
        earnings_and_benefits_page.agree_with_claimant_pension_benefits_question.set_for(user)
      end

      # Response Page
      def answer_defend_claim_question
        response_page.defend_claim_question.set_for(user)
      end

      # Your Representative Page
      def answer_have_representative_question
        your_representative_page.have_representative_question.set_for(user)
      end

      # Your Representative's Details Page
      def answer_type_of_representative_question
        your_representatives_details_page.type_of_representative_question.set_for(user)
      end

      def answer_representative_org_name_question
        your_representatives_details_page.representative_org_name_question.set(user.representative_org_name)
      end

      def answer_representative_name_question
        your_representatives_details_page.representative_name_question.set(user.representative_name)
      end

      def answer_representative_building_question
        your_representatives_details_page.representative_building_question.set(user.representative_building)
      end

      def answer_representative_street_question
        your_representatives_details_page.representative_street_question.set(user.representative_street)
      end

      def answer_representative_town_question
        your_representatives_details_page.representative_town_question.set(user.representative_town)
      end

      def answer_representative_county_question
        your_representatives_details_page.representative_county_question.set(user.representative_county)
      end

      def answer_representative_postcode_question
        your_representatives_details_page.representative_postcode_question.set(user.representative_postcode)
      end

      def answer_representative_phone_question
        your_representatives_details_page.representative_phone_question.set(user.representative_phone)
      end

      def answer_representative_mobile_question
        your_representatives_details_page.representative_mobile_question.set(user.representative_mobile)
      end

      def answer_representative_dx_number_question
        your_representatives_details_page.representative_dx_number_question.set(user.representative_dx_number)
      end

      def answer_representative_reference_question
        your_representatives_details_page.representative_reference_question.set(user.representative_reference)
      end

      def answer_representative_contact_preference_question
        your_representatives_details_page.representative_contact_preference_question.set_for(user)
      end

      # Disability Page
      def answer_disability_question
        disability_page.disability_question.set_for(user)
      end

      # Employers Contract Claim Page
      def answer_make_employer_contract_claim_question
        employers_contract_claim_page.make_employer_contract_claim_question.set_for(user)
      end

      # Additional Information Page
      def answer_upload_additional_information_question
        additional_information_page.attach_additional_information_file(user)
      end

      # Confirmation of Supplied Details Page
      def answer_email_receipt_question
        confirmation_of_supplied_details_page.email_receipt_question.set(user.email_receipt)
      end

      # Entire Form
      def answer_all_questions # rubocop:disable Metrics/MethodLength
        start_page.load
        start_page.next

        answer_case_number_question
        answer_name_question
        answer_contact_question
        answer_building_name_question
        answer_street_question
        answer_town_question
        answer_county_question
        answer_postcode_question
        answer_dx_number_question
        answer_contact_number_question
        answer_contact_mobile_number_question
        answer_contact_preference_question
        answer_organisation_more_than_one_site_question
        answer_organisation_employ_gb_question

        respondents_details_page.next

        answer_claimants_name_question
        answer_agree_with_early_conciliation_details_question
        answer_agree_with_employment_dates_question
        answer_continued_employment_question
        answer_agree_with_claimants_description_of_job_or_title_question

        claimants_details_page.next

        answer_agree_with_claimants_hours_question
        answer_agree_with_earnings_details_question
        answer_agree_with_claimant_notice_question
        answer_agree_with_claimant_pension_benefits_question

        earnings_and_benefits_page.next

        answer_defend_claim_question

        response_page.next

        answer_have_representative_question

        your_representative_page.next

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

        answer_disability_question

        disability_page.next

        answer_make_employer_contract_claim_question

        employers_contract_claim_page.next

        answer_upload_additional_information_question

        additional_information_page.next

        answer_email_receipt_question
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
        s3_config = {
            region: ENV.fetch('AWS_REGION', 'us-east-1'),
            access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID', 'accessKey1'),
            secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY', 'verySecretKey1'),
            endpoint: ENV.fetch('AWS_ENDPOINT', 'http://localhost:9000/'),
            force_path_style: ENV.fetch('AWS_S3_FORCE_PATH_STYLE', 'true') == 'true'
        }
        local_s3_client = Aws::S3::Client.new(s3_config)
        aws_response = Aws::S3::Bucket.new(client: local_s3_client, name: ENV.fetch('S3_DIRECT_UPLOAD_BUCKET', 'et3directbuckettest')).
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

      # TODO: RST-960 Stub the request to the presigned S3 URL, acknowledge the file is uploaded and provide a response in XML.
      def stub_s3_submission
        stub_request(:post, "http://s3.et.127.0.0.1.nip.io:3100/etapidirectbucket").
          to_return(
            headers: { 'Content-Type': 'application/xml'},
            body:
              {
                "PostResponse": {
                  "Bucket": "etapidirectbucket",
                  "Key": "1529593762980",
                  "ETag": "&#34;ded7be3cf57f73a42ab39da2439025bb&#34;",
                  "Location": "http://s3.et.127.0.0.1.nip.io:3100/etapidirectbucket/1529593762980"
                }
              }.to_xml
          )
      end

    end
  end
end

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
                    "pdf_url": "s3/link/to/form.pdf",
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
        stub_request(:post, "#{ENV.fetch('ET_API_URL', 'http://api.et.127.0.0.1.nip.io:3100/api')}/v2/s3/create_signed_url").
          to_return(
            headers: { 'Content-Type': 'application/json' },
            body:
              {
                "data": {
                  "fields": {
                    "key": "1529575844061",
                    "policy": "eyJleHBpcmF0aW9uIjoiMjAxOC0wNi0yMVQxMToxMDo0NFloiLCJjb25kaXRpb25zIjpbeyJidWNrZXQiOiJldGFwaWRpcmVjdGJ1Y2tldCJ9LHsia2V5IjoiMTUyOTU3NTg0NDA2MSJ9LHsieC1hbXotY3JlZGVudGlhbCI6ImFjY2Vzc0tleTEvMjAxODA2MjEvdXMtZWFzdC0xL3MzL2F3czRfcmVxdWVzdCJ9LHsieC1hbXotYWxnb3JpdGhtIjoiQVdTNC1ITUFDLVNIQTI1NiJ9LHsieC1hbXotZGF0ZSI6IjIwMTgwNjIxVDEwMTA0NFoifV19",
                    "x-amz-algorithm": "AWS4-HMAC-SHA256",
                    "x-amz-credential": "accessKey1/20180621/us-east-1/s3/aws4_request",
                    "x-amz-date": "20180621T101044Z",
                    "x-amz-signature": "52417c85d3302add1950ecf125ab3bb85b5b7b436b6473c00389375dbee43f21"
                  },
                  "url": "http://s3.et.127.0.0.1.nip.io:3100/etapidirectbucket"
                },
                "status": "accepted",
                "uuid": "a333d77d-a42a-42b3-9d0c-1de77aea4317"
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

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

      def claimants_invalid_dates
        @claimant = FactoryBot.create(:claimant, :claimant_invalid_dates)
      end

      def given_valid_user
        @user = FactoryBot.create(:user_ui, :valid)
      end

      def start_a_new_et3_response
        start_page.load(locale: current_locale_parameter)
        start_page.next
      end

      def registration_start
        answer_registration_page
      end

      def sign_in
        session_page.memorable_word_question.set(@user.memorable_word)
        session_page.reference_number_question.set(@save_and_return_number)
        session_page.next
      end

      def answer_registration_page
        registration_page.email_question.set(@user.email)
        registration_page.memorable_word_question.set(@user.memorable_word)
        @save_and_return_number = registration_page.save_and_return_number.value.text

        registration_page.next
      end

      # Respondent's Details Page
      def answer_respondents_details
        user = @respondent
        respondents_details_page.case_number_question.set(user.case_number)
        respondents_details_page.title_question.set(user.title)
        respondents_details_page.other_title_question.set(user.other_title) if user.other_title.present?
        respondents_details_page.name_question.set(user.name)
        respondents_details_page.company_number_question.set(user.company_number)
        respondents_details_page.contact_question.set(user.contact)
        respondents_details_page.building_name_question.set(user.building_name)
        respondents_details_page.street_question.set(user.street_name)
        respondents_details_page.town_question.set(user.town)
        respondents_details_page.county_question.set(user.county)
        respondents_details_page.postcode_question.set(user.postcode)
        respondents_details_page.dx_number_question.set(user.dx_number)
        respondents_details_page.contact_number_question.set(user.contact_number)
        respondents_details_page.contact_mobile_number_question.set(user.contact_mobile_number)
        respondents_details_page.contact_preference_question.set(user.contact_preference.to_s.split('.').last.to_sym)
        respondents_details_page.email_address_question.set(user.email_address) if user.contact_preference.to_s.split('.').last == 'email'
        respondents_details_page.fax_number_question.set(user.fax_number) if user.contact_preference.to_s.split('.').last == 'fax'
        respondents_details_page.organisation_more_than_one_site_question.set(user.organisation_more_than_one_site.to_s.split('.').last.to_sym)
        respondents_details_page.employment_at_site_number_question.set(user.employment_at_site_number) if user.organisation_more_than_one_site.to_s.split('.')[-2] == 'yes'
        respondents_details_page.organisation_employ_gb_question.set(user.organisation_employ_gb)
        respondents_details_page.video_call_question.set(user.video_call.to_s.split('.').last.to_sym)

        respondents_details_page.next
      end

      # Claimant's Details Page
      def answer_claimants_details
        user = @claimant
        claimants_details_page.claimants_name_question.set(user.claimants_name)
        claimants_details_page.agree_with_early_conciliation_details_question.set(user.agree_with_early_conciliation_details.to_s.split('.').last.to_sym)
        claimants_details_page.disagree_conciliation_reason.set(user.disagree_conciliation_reason) if user.agree_with_early_conciliation_details.to_s.split('.').last == 'no'
        claimants_details_page.agree_with_employment_dates_question.set(user.agree_with_employment_dates.to_s.split('.').last.to_sym)
        if user.agree_with_employment_dates.to_s.split('.').last == 'no'
          claimants_details_page.employment_start.set(user.employment_start)
          claimants_details_page.employment_end.set(user.employment_end)
          claimants_details_page.disagree_employment.set(user.disagree_employment)
        end
        claimants_details_page.continued_employment_question.set(user.continued_employment.to_s.split('.').last.to_sym)
        claimants_details_page.agree_with_claimants_description_of_job_or_title_question.set(user.agree_with_claimants_description_of_job_or_title.to_s.split('.').last.to_sym)
        claimants_details_page.disagree_claimants_job_or_title.set(user.disagree_claimants_job_or_title) if user.agree_with_claimants_description_of_job_or_title.to_s.split('.').last == 'no'
        claimants_details_page.next
      end

      # Earnings and Benefits Page
      def answer_earnings_and_benefits
        user = @claimant
        earnings_and_benefits_page.agree_with_claimants_hours_question.set(user.agree_with_claimants_hours.to_s.split('.').last.to_sym)
        earnings_and_benefits_page.queried_hours.set(user.queried_hours)
        earnings_and_benefits_page.agree_with_earnings_details_question.set(user.agree_with_earnings_details.to_s.split('.').last.to_sym)
        if user.agree_with_earnings_details.to_s.split('.').last == 'no'
          earnings_and_benefits_page.queried_pay_before_tax.set(user.queried_pay_before_tax)
          earnings_and_benefits_page.queried_pay_before_tax_period.set(user.queried_pay_before_tax_period.to_s.split('.').last.to_sym)
          earnings_and_benefits_page.queried_take_home_pay.set(user.queried_take_home_pay)
          earnings_and_benefits_page.queried_take_home_pay_period.set(user.queried_take_home_pay_period.to_s.split('.').last.to_sym)
        end
        earnings_and_benefits_page.agree_with_claimant_notice_question.set(user.agree_with_claimant_notice.to_s.split('.').last.to_sym)
        if user.agree_with_claimant_notice.to_s.split('.').last == 'no'
          earnings_and_benefits_page.disagree_claimant_notice_reason.set(user.disagree_claimant_notice_reason)
        end
        earnings_and_benefits_page.agree_with_claimant_notice_question.set(:yes)
        earnings_and_benefits_page.agree_with_claimant_pension_benefits_question.set(user.agree_with_claimant_pension_benefits.to_s.split('.').last.to_sym)
        if user.agree_with_claimant_pension_benefits.to_s.split('.').last == 'no'
          earnings_and_benefits_page.disagree_claimant_pension_benefits_reason.set(user.disagree_claimant_pension_benefits_reason)
        end
        earnings_and_benefits_page.agree_with_claimant_notice_question.set(:no)
        earnings_and_benefits_page.next
      end

      # Response Page
      def answer_defend_claim_question
        user = @claimant
        response_page.defend_claim_question.set(user.defend_claim.to_s.split('.').last.to_sym)
        response_page.defend_claim_facts.set(user.defend_claim_facts) if user.defend_claim.to_s.split('.').last == 'yes'
        response_page.next
      end

      # Your Representative Page
      def answer_representative
        user = @representative
        if t(user.have_representative) == t('questions.your_representatives.have_representative.options.yes')
          your_representative_page.have_representative_question.set(user.have_representative.to_s.split('.').last.to_sym)
          your_representative_page.next
          your_representatives_details_page.type_of_representative_question.set(user.type.to_s.split('.').last.to_sym)
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
          your_representatives_details_page.representative_contact_preference_question.set(user.representative_contact_preference.to_s.split('.').last.to_sym)
          if user.representative_contact_preference.end_with?('.email')
            your_representatives_details_page.preference_email.set(user.representative_email)
          end
          if user.representative_contact_preference.end_with?('.fax')
            your_representatives_details_page.preference_fax.set(user.representative_fax)
          end
          your_representatives_details_page.next
        else
          your_representative_page.next
        end
      end

      # Disability Page
      def answer_disability_question
        user = @respondent
        disability_page.disability_question.set(user.disability.to_s.split('.').last.to_sym)
        if user.disability.end_with?('.yes') && user.disability_information != nil
          disability_page.disability_information.set(user.disability_information)
        end

        disability_page.next
      end

      # Employers Contract Claim Page
      def answer_employers_contract_claim
        user = @respondent
        employers_contract_claim_page.make_employer_contract_claim_question.set(user.make_employer_contract_claim.to_s.split('.').last.to_sym)
        if user.make_employer_contract_claim.end_with?('.yes')
          employers_contract_claim_page.claim_information.set(user.claim_information)
        end

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
        stub_request(:post, "#{ENV.fetch('ET_API_URL', 'http://api.et.127.0.0.1.nip.io:3100/api/v2')}/respondents/build_response").
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
        stub_request(:post, "#{ENV.fetch('ET_API_URL', 'http://api.et.127.0.0.1.nip.io:3100/api/v2')}/respondents/build_response").
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

      # Stub Calls to API for Azure Blob Storage URLs
      def stub_create_blob_to_azure
        key = "direct_uploads/#{SecureRandom.uuid}".freeze


        stub_request(:post, "#{ENV.fetch('ET_API_URL', 'http://api.et.127.0.0.1.nip.io:3100/api/v2')}/create_blob").
          to_return(
            headers: { 'Content-Type': 'application/json' },
            body:
              {
                "data": {
                  "key": key
                },
                "meta": {
                  "cloud_provider": "azure"
                },
                "status": "accepted",
                "uuid": SecureRandom.uuid
              }.to_json
          )
      end
    end
  end
end
RSpec.configure do |c|
  c.include ET3::Test::Setup, type: :feature
end

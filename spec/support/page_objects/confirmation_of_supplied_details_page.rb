module ET3
  module Test
    class ConfirmationOfSuppliedDetailsPage < BasePage
      include EtTestHelpers::Page
      set_url '/respond/confirmation_of_supplied_details'
      element :error_header, :error_titled, 'errors.header', exact: true

      section :confirmation_of_respondents_details_answers, :check_answers_section, 'questions.confirmation_of_respondents_details_answers.caption', exact: true do
        section :case_number_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.respondents_details.case_number', exact: true do
          element :case_number_answer, :govuk_summary_list_col
        end
        section :name_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.respondents_details.name', exact: true do
          element :name_answer, :govuk_summary_list_col
        end
        section :company_number_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.respondents_details.company_number', exact: true do
          element :company_number_answer, :govuk_summary_list_col
        end
        section :type_of_employer_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.respondents_details.type_of_employer', exact: true do
          element :type_of_employer_answer, :govuk_summary_list_col
        end
        section :title_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.respondents_details.title', exact: true do
          element :title_answer, :govuk_summary_list_col
        end
        section :contact_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.respondents_details.contact', exact: true do
          element :contact_answer, :govuk_summary_list_col
        end
        section :building_name_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.respondents_details.building_name', exact: true do
          element :building_name_answer, :govuk_summary_list_col
        end
        section :street_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.respondents_details.street', exact: true do
          element :street_answer, :govuk_summary_list_col
        end
        section :town_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.respondents_details.town', exact: true do
          element :town_answer, :govuk_summary_list_col
        end
        section :county_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.respondents_details.county', exact: true do
          element :county_answer, :govuk_summary_list_col
        end
        section :postcode_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.respondents_details.postcode', exact: true do
          element :postcode_answer, :govuk_summary_list_col
        end
        section :dx_number_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.respondents_details.dx_number', exact: true do
          element :dx_number_answer, :govuk_summary_list_col
        end
        section :contact_number_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.respondents_details.contact_number', exact: true do
          element :contact_number_answer, :govuk_summary_list_col
        end
        section :mobile_number_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.respondents_details.contact_mobile_number', exact: true do
          element :mobile_number_answer, :govuk_summary_list_col
        end
        section :contact_preference_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.respondents_details.contact_preference', exact: true do
          element :contact_preference_answer, :govuk_summary_list_col
        end
        section :email_address_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.respondents_details.email_address', exact: true do
          element :email_address_answer, :govuk_summary_list_col
        end
        section :organisation_employ_gb_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.respondents_details.organisation_employ_gb', exact: true do
          element :organisation_employ_gb_answer, :govuk_summary_list_col
        end
        section :organisation_more_than_one_site_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.respondents_details.organisation_more_than_one_site', exact: true do
          element :organisation_more_than_one_site_answer, :govuk_summary_list_col
        end
        section :allow_phone_or_video_attendance_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.respondents_details.allow_phone_or_video_attendance', exact: true do
          element :allow_phone_or_video_attendance_answer, :govuk_summary_list_col
        end
        section :employment_at_site_number_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.respondents_details.employment_at_site_number', exact: true do
          element :employment_at_site_number_answer, :govuk_summary_list_col
        end
        element :edit_respondent_details_page_link, :link_named, 'links.confirmation_of_supplied_details.edit_respondent_details_page', exact: true
      end
      section :confirmation_of_case_heard_by_answers, :check_answers_section, 'questions.confirmation_of_case_heard_by_answers.caption', exact: true do
        section :case_heard_by_preference_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.case_heard_by.case_heard_by_preference', exact: true do
          element :case_heard_by_preference_answer, :govuk_summary_list_col
        end
        section :case_heard_by_preference_reason_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.case_heard_by.case_heard_by_preference_reason', exact: true do
          element :case_heard_by_preference_reason_answer, :govuk_summary_list_col
        end
        element :edit_case_heard_by_page_link, :link_named, 'links.confirmation_of_supplied_details.edit_case_heard_by_page', exact: true
      end

      section :confirmation_of_claimants_details_answers, :check_answers_section, 'questions.confirmation_of_claimants_details_answers.caption', exact: true do
        section :claimants_name_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.claimants_details.claimants_name', exact: true do
          element :claimants_name_answer, :govuk_summary_list_col
        end
        section :agree_with_early_conciliation_details_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.claimants_details.agree_with_early_conciliation_details', exact: true do
          element :agree_with_early_conciliation_details_answer, :govuk_summary_list_col
        end
        section :disagree_conciliation_reason_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.claimants_details.disagree_conciliation_reason', exact: true do
          element :disagree_conciliation_reason_answer, :govuk_summary_list_col
        end
        section :agree_with_employment_dates_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.claimants_details.agree_with_employment_dates', exact: true do
          element :agree_with_employment_dates_answer, :govuk_summary_list_col
        end
        section :employment_start_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.claimants_details.employment_start', exact: true do
          element :employment_start_answer, :govuk_summary_list_col
        end
        section :employment_end_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.claimants_details.employment_end', exact: true do
          element :employment_end_answer, :govuk_summary_list_col
        end
        section :disagree_employment_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.claimants_details.disagree_employment', exact: true do
          element :disagree_employment_answer, :govuk_summary_list_col
        end
        section :continued_employment_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.claimants_details.continued_employment', exact: true do
          element :continued_employment_answer, :govuk_summary_list_col
        end
        section :agree_with_claimants_description_of_job_or_title_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.claimants_details.agree_with_claimants_description_of_job_or_title', exact: true do
          element :agree_with_claimants_description_of_job_or_title_answer, :govuk_summary_list_col
        end
        section :disagree_claimants_job_or_title_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.claimants_details.disagree_claimants_job_or_title', exact: true do
          element :disagree_claimants_job_or_title_answer, :govuk_summary_list_col
        end
        element :edit_claimants_details_page_link, :link_named, 'links.confirmation_of_supplied_details.edit_claimants_details_page', exact: true
      end

      section :confirmation_of_earnings_and_benefits_answers, :check_answers_section, 'questions.confirmation_of_earnings_and_benefits_answers.caption', exact: true do
        section :agree_with_claimants_hours_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.earnings_and_benefits.agree_with_claimants_hours', exact: true do
          element :agree_with_claimants_hours_answer, :govuk_summary_list_col
        end
        section :queried_hours_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.earnings_and_benefits.queried_hours', exact: true do
          element :queried_hours_answer, :govuk_summary_list_col
        end
        section :agree_with_earnings_details_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.earnings_and_benefits.agree_with_earnings_details', exact: true do
          element :agree_with_earnings_details_answer, :govuk_summary_list_col
        end
        section :queried_pay_before_tax_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.earnings_and_benefits.queried_pay_before_tax', exact: true do
          element :queried_pay_before_tax_answer, :govuk_summary_list_col
        end
        section :queried_pay_before_tax_period_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.earnings_and_benefits.queried_pay_before_tax_period', exact: true do
          element :queried_pay_before_tax_period_answer, :govuk_summary_list_col
        end
        section :queried_take_home_pay_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.earnings_and_benefits.queried_take_home_pay', exact: true do
          element :queried_take_home_pay_answer, :govuk_summary_list_col
        end
        section :queried_take_home_pay_period_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.earnings_and_benefits.queried_take_home_pay_period', exact: true do
          element :queried_take_home_pay_period_answer, :govuk_summary_list_col
        end
        section :agree_with_claimant_notice_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.earnings_and_benefits.agree_with_claimant_notice', exact: true do
          element :agree_with_claimant_notice_answer, :govuk_summary_list_col
        end
        section :disagree_claimant_notice_reason_row, '.govuk-summary-list__row[data-attribute=disagree_claimant_notice_reason]' do
          element :disagree_claimant_notice_reason_answer, :govuk_summary_list_col
        end
        section :agree_with_claimant_pension_benefits_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.earnings_and_benefits.agree_with_claimant_pension_benefits', exact: true do
          element :agree_with_claimant_pension_benefits_answer, :govuk_summary_list_col
        end
        section :disagree_claimant_pension_benefits_reason_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.earnings_and_benefits.disagree_claimant_pension_benefits_reason', exact: true do
          element :disagree_claimant_pension_benefits_reason_answer, :govuk_summary_list_col
        end
        element :edit_earnings_and_benefit_page_link, :link_named, 'links.confirmation_of_supplied_details.edit_earnings_and_benefit_page', exact: true
      end

      section :confirmation_of_response_answers, :check_answers_section, 'questions.confirmation_of_response_answers.caption', exact: true do
        section :defend_claim_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.responses.defend_claim', exact: true do
          element :defend_claim_answer, :govuk_summary_list_col
        end
        section :defend_claim_facts_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.responses.defend_claim_facts', exact: true do
          element :defend_claim_facts_answer, :govuk_summary_list_col
        end
        element :edit_response_page_link, :link_named, 'links.confirmation_of_supplied_details.edit_response_page', exact: true
      end

      section :confirmation_of_your_representative_answers, :check_answers_section, 'questions.confirmation_of_your_representative_answers.caption', exact: true do
        section :have_representative_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.your_representatives.have_representative', exact: true do
          element :have_representative_answer, :govuk_summary_list_col
        end
        element :edit_representative_page_link, :link_named, 'links.confirmation_of_supplied_details.edit_representative_page', exact: true
      end

      section :confirmation_of_your_representatives_details_answers, :check_answers_section, 'questions.confirmation_of_your_representatives_details_answers.caption', exact: true do
        section :type_of_representative_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.your_representatives_details.type_of_representative', exact: true do
          element :type_of_representative_answer, :govuk_summary_list_col
        end
        section :representative_org_name_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.your_representatives_details.representative_org_name', exact: true do
          element :representative_org_name_answer, :govuk_summary_list_col
        end
        section :representative_name_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.your_representatives_details.representative_name', exact: true do
          element :representative_name_answer, :govuk_summary_list_col
        end
        section :representative_building_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.your_representatives_details.representative_building', exact: true do
          element :representative_building_answer, :govuk_summary_list_col
        end
        section :representative_street_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.your_representatives_details.representative_street', exact: true do
          element :representative_street_answer, :govuk_summary_list_col
        end
        section :representative_town_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.your_representatives_details.representative_town', exact: true do
          element :representative_town_answer, :govuk_summary_list_col
        end
        section :representative_county_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.your_representatives_details.representative_county', exact: true do
          element :representative_county_answer, :govuk_summary_list_col
        end
        section :representative_postcode_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.your_representatives_details.representative_postcode', exact: true do
          element :representative_postcode_answer, :govuk_summary_list_col
        end
        section :representative_phone_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.your_representatives_details.representative_phone', exact: true do
          element :representative_phone_answer, :govuk_summary_list_col
        end
        section :representative_mobile_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.your_representatives_details.representative_mobile', exact: true do
          element :representative_mobile_answer, :govuk_summary_list_col
        end
        section :representative_dx_number_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.your_representatives_details.representative_dx_number', exact: true do
          element :representative_dx_number_answer, :govuk_summary_list_col
        end
        section :representative_reference_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.your_representatives_details.representative_reference', exact: true do
          element :representative_reference_answer, :govuk_summary_list_col
        end
        section :representative_contact_preference_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.your_representatives_details.representative_contact_preference', exact: true do
          element :representative_contact_preference_answer, :govuk_summary_list_col
        end
        section :email_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.your_representatives_details.preference_email', exact: true do
          element :email_answer, :govuk_summary_list_col
        end
        section :allow_phone_or_video_attendance_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.your_representatives_details.allow_phone_or_video_attendance', exact: true do
          element :allow_phone_or_video_attendance_answer, :govuk_summary_list_col
        end

        element :edit_representative_details_page_link, :link_named, 'links.confirmation_of_supplied_details.edit_representative_details_page', exact: true

      end

      section :confirmation_of_disability_answers, :check_answers_section, 'questions.confirmation_of_disability_answers.caption', exact: true do
        section :disability_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.disabilities.disability', exact: true do
          element :disability_answer, :govuk_summary_list_col
        end
        section :disability_information_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.disabilities.disability_information', exact: true do
          element :disability_information_answer, :govuk_summary_list_col
        end
        element :edit_disability_page_link, :link_named, 'links.confirmation_of_supplied_details.edit_disability_page', exact: true
      end


      section :confirmation_of_employer_contract_claim_answers, :check_answers_section, 'questions.confirmation_of_employer_contract_claim_answers.caption', exact: true do
        section :make_employer_contract_claim_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.employers_contract_claims.make_employer_contract_claim', exact: true do
          element :make_employer_contract_claim_answer, :govuk_summary_list_col
        end
        section :claim_information_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.employers_contract_claims.claim_information', exact: true do
          element :claim_information_answer, :govuk_summary_list_col
        end
        element :edit_employer_contract_claim_page_link, :link_named, 'links.confirmation_of_supplied_details.edit_employer_contract_claim_page', exact: true
      end

      section :confirmation_of_additional_information_answers, :check_answers_section, 'questions.confirmation_of_additional_information_answers.caption', exact: true do
        section :upload_additional_information_row, :govuk_summary_list_row, :'confirmation_of_supplied_details.additional_informations.upload_additional_information', exact: true do
          element :upload_additional_information_answer, :govuk_summary_list_col
          element :remove_file_link, :link_named, 'components.confirmation_of_supplied_details.remove_file_link'
        end
        element :edit_additional_information_page_link, :link_named, 'links.confirmation_of_supplied_details.edit_additional_information_page', exact: true
      end


      gds_text_input :email_receipt_question, :'questions.email_receipt', exact: false

      gds_submit_button :continue_button, :'confirmation.submit'
      def submit_form
        continue_button.click
      end
    end
  end
end

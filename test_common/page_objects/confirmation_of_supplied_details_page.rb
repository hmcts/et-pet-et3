module ET3
  module Test
    class ConfirmationOfSuppliedDetailsPage < BasePage
      set_url '/respond/confirmation_of_supplied_details'
      element :error_header, :error_titled, 'errors.header', exact: true
      section :email_receipt_question, :question_labelled, 'questions.email_receipt.label', exact: false do
        element :field, :css, 'input'
        element :error_invalid_email, :exact_error_text, 'errors.messages.invalid_email', exact: false
        delegate :set, to: :field
      end
      element :submit_guidance, :content_header, 'confirmation.submit_guidance'
      section :confirmation_of_respondents_details_answers, :table_captioned, 'questions.confirmation_of_respondents_details_answers.caption', exact: true do
        section :case_number_row, :table_row_with_td_labelled, 'questions.case_number.label', exact: true do
          element :case_number_answer, :return_answer
        end
        section :name_row, :table_row_with_td_labelled, 'questions.name.label', exact: true do
          element :name_answer, :return_answer
        end
        section :contact_row, :table_row_with_td_labelled, 'questions.contact.label', exact: true do
          element :contact_answer, :return_answer
        end
        section :building_name_row, :table_row_with_td_labelled, 'questions.building_name.label', exact: true do
          element :building_name_answer, :return_answer
        end
        section :street_row, :table_row_with_td_labelled, 'questions.street.label', exact: true do
          element :street_answer, :return_answer
        end
        section :town_row, :table_row_with_td_labelled, 'questions.town.label', exact: true do
          element :town_answer, :return_answer
        end
        section :county_row, :table_row_with_td_labelled, 'questions.county.label', exact: true do
          element :county_answer, :return_answer
        end
        section :postcode_row, :table_row_with_td_labelled, 'questions.postcode.label', exact: true do
          element :postcode_answer, :return_answer
        end
        section :dx_number_row, :table_row_with_td_labelled, 'questions.dx_number.label', exact: true do
          element :dx_number_answer, :return_answer
        end
        section :contact_number_row, :table_row_with_td_labelled, 'questions.contact_number.label', exact: true do
          element :contact_number_answer, :return_answer
        end
        section :mobile_number_row, :table_row_with_td_labelled, 'questions.contact_mobile_number.label', exact: true do
          element :mobile_number_answer, :return_answer
        end
        section :contact_preference_row, :table_row_with_td_labelled, 'questions.contact_preference.label', exact: true do
          element :contact_preference_answer, :return_answer
        end
        section :email_address_row, :table_row_with_td_labelled, 'questions.contact_preference.email.input_label', exact: true do
          element :email_address_answer, :return_answer
        end
        section :fax_number_row, :table_row_with_td_labelled, 'questions.contact_preference.fax.input_label', exact: true do
          element :fax_number_answer, :return_answer
        end
        section :organisation_employ_gb_row, :table_row_with_td_labelled, 'questions.organisation_employ_gb.label', exact: true do
          element :organisation_employ_gb_answer, :return_answer
        end
        section :organisation_more_than_one_site_row, :table_row_with_td_labelled, 'questions.organisation_more_than_one_site.label', exact: true do
          element :organisation_more_than_one_site_answer, :return_answer
        end
        section :employment_at_site_number_row, :table_row_with_td_labelled, 'questions.organisation_more_than_one_site.employment_at_site_number.label', exact: true do
          element :employment_at_site_number_answer, :return_answer
        end
        element :edit_page_link, :link_named, 'links.confirmation_of_supplied_details.edit_page', exact: true
      end

      section :confirmation_of_claimants_details_answers, :table_captioned, 'questions.confirmation_of_claimants_details_answers.caption', exact: true do
        section :claimants_name_row, :table_row_with_td_labelled, 'questions.claimants_name.label', exact: true do
          element :claimants_name_answer, :return_answer
        end
        section :agree_with_early_conciliation_details_row, :table_row_with_td_labelled, 'questions.agree_with_early_conciliation_details.label', exact: true do
          element :agree_with_early_conciliation_details_answer, :return_answer
        end
        section :disagree_conciliation_reason_row, :table_row_with_td_labelled, 'questions.agree_with_early_conciliation_details.disagree_conciliation_reason.label', exact: true do
          element :disagree_conciliation_reason_answer, :return_answer
        end
        section :agree_with_employment_dates_row, :table_row_with_td_labelled, 'questions.agree_with_employment_dates.label', exact: true do
          element :agree_with_employment_dates_answer, :return_answer
        end
        section :employment_start_row, :table_row_with_td_labelled, 'questions.agree_with_employment_dates.employment_start.label', exact: true do
          element :employment_start_answer, :return_answer
        end
        section :employment_end_row, :table_row_with_td_labelled, 'questions.agree_with_employment_dates.employment_end.label', exact: true do
          element :employment_end_answer, :return_answer
        end
        section :disagree_employment_row, :table_row_with_td_labelled, 'questions.agree_with_employment_dates.disagree_employment.label', exact: true do
          element :disagree_employment_answer, :return_answer
        end
        section :continued_employment_row, :table_row_with_td_labelled, 'questions.continued_employment.label', exact: true do
          element :continued_employment_answer, :return_answer
        end
        section :agree_with_claimants_description_of_job_or_title_row, :table_row_with_td_labelled, 'questions.agree_with_claimants_description_of_job_or_title.label', exact: true do
          element :agree_with_claimants_description_of_job_or_title_answer, :return_answer
        end
        section :disagree_claimants_job_or_title_row, :table_row_with_td_labelled, 'questions.agree_with_claimants_description_of_job_or_title.disagree_claimants_job_or_title.label', exact: true do
          element :disagree_claimants_job_or_title_answer, :return_answer
        end
        element :edit_page_link, :link_named, 'links.confirmation_of_supplied_details.edit_page', exact: true
      end

      section :confirmation_of_earnings_and_benefits_answers, :table_captioned, 'questions.confirmation_of_earnings_and_benefits_answers.caption', exact: true do
        section :agree_with_claimants_hours_row, :table_row_with_td_labelled, 'questions.agree_with_claimants_hours.label', exact: true do
          element :agree_with_claimants_hours_answer, :return_answer
        end
        section :queried_hours_row, :table_row_with_td_labelled, 'questions.agree_with_claimants_hours.queried_hours.label', exact: true do
          element :queried_hours_answer, :return_answer
        end
        section :agree_with_earnings_details_row, :table_row_with_td_labelled, 'questions.agree_with_earnings_details.label', exact: true do
          element :agree_with_earnings_details_answer, :return_answer
        end
        section :queried_pay_before_tax_row, :table_row_with_td_labelled, 'questions.agree_with_earnings_details.queried_pay_before_tax.label', exact: true do
          element :queried_pay_before_tax_answer, :return_answer
        end
        section :queried_pay_before_tax_period_row, :table_row_with_td_labelled, 'questions.agree_with_earnings_details.queried_pay_before_tax_period.label', exact: true do
          element :queried_pay_before_tax_period_answer, :return_answer
        end
        section :queried_take_home_pay_row, :table_row_with_td_labelled, 'questions.agree_with_earnings_details.queried_take_home_pay.label', exact: true do
          element :queried_take_home_pay_answer, :return_answer
        end
        section :queried_take_home_pay_period_row, :table_row_with_td_labelled, 'questions.agree_with_earnings_details.queried_take_home_pay_period.label', exact: true do
          element :queried_take_home_pay_period_answer, :return_answer
        end
        section :agree_with_claimant_notice_row, :table_row_with_td_labelled, 'questions.agree_with_claimant_notice.label', exact: true do
          element :agree_with_claimant_notice_answer, :return_answer
        end
        section :disagree_claimant_notice_reason_row, :table_row_with_td_labelled, 'questions.agree_with_claimant_notice.disagree_claimant_notice_reason.label', exact: true do
          element :disagree_claimant_notice_reason_answer, :return_answer
        end
        section :agree_with_claimant_pension_benefits_row, :table_row_with_td_labelled, 'questions.agree_with_claimant_pension_benefits.label', exact: true do
          element :agree_with_claimant_pension_benefits_answer, :return_answer
        end
        section :disagree_claimant_pension_benefits_reason_row, :table_row_with_td_labelled, 'questions.agree_with_claimant_pension_benefits.disagree_claimant_pension_benefits_reason.label', exact: true do
          element :disagree_claimant_pension_benefits_reason_answer, :return_answer
        end
        element :edit_page_link, :link_named, 'links.confirmation_of_supplied_details.edit_page', exact: true
      end

      section :confirmation_of_response_answers, :table_captioned, 'questions.confirmation_of_response_answers.caption', exact: true do
        section :defend_claim_row, :table_row_with_td_labelled, 'questions.defend_claim.label', exact: true do
          element :defend_claim_answer, :return_answer
        end
        section :defend_claim_facts_row, :table_row_with_td_labelled, 'questions.defend_claim.defend_claim_facts.label', exact: true do
          element :defend_claim_facts_answer, :return_answer
        end
        element :edit_page_link, :link_named, 'links.confirmation_of_supplied_details.edit_page', exact: true
      end

      section :confirmation_of_your_representative_answers, :table_captioned, 'questions.confirmation_of_your_representative_answers.caption', exact: true do
        section :have_representative_row, :table_row_with_td_labelled, 'questions.have_representative.label', exact: true do
          element :have_representative_answer, :return_answer
        end
        element :edit_page_link, :link_named, 'links.confirmation_of_supplied_details.edit_page', exact: true
      end

      section :confirmation_of_your_representatives_details_answers, :table_captioned, 'questions.confirmation_of_your_representatives_details_answers.caption', exact: true do
        section :type_of_representative_row, :table_row_with_td_labelled, 'questions.type_of_representative.label', exact: true do
          element :type_of_representative_answer, :return_answer
        end
        section :representative_org_name_row, :table_row_with_td_labelled, 'questions.representative_org_name.label', exact: true do
          element :representative_org_name_answer, :return_answer
        end
        section :representative_name_row, :table_row_with_td_labelled, 'questions.representative_name.label', exact: true do
          element :representative_name_answer, :return_answer
        end
        section :representative_building_row, :table_row_with_td_labelled, 'questions.representative_building.label', exact: true do
          element :representative_building_answer, :return_answer
        end
        section :representative_street_row, :table_row_with_td_labelled, 'questions.representative_street.label', exact: true do
          element :representative_street_answer, :return_answer
        end
        section :representative_town_row, :table_row_with_td_labelled, 'questions.representative_town.label', exact: true do
          element :representative_town_answer, :return_answer
        end
        section :representative_county_row, :table_row_with_td_labelled, 'questions.representative_county.label', exact: true do
          element :representative_county_answer, :return_answer
        end
        section :representative_postcode_row, :table_row_with_td_labelled, 'questions.representative_postcode.label', exact: true do
          element :representative_postcode_answer, :return_answer
        end
        section :representative_phone_row, :table_row_with_td_labelled, 'questions.representative_phone.label', exact: true do
          element :representative_phone_answer, :return_answer
        end
        section :representative_mobile_row, :table_row_with_td_labelled, 'questions.representative_mobile.label', exact: true do
          element :representative_mobile_answer, :return_answer
        end
        section :representative_dx_number_row, :table_row_with_td_labelled, 'questions.representative_dx_number.label', exact: true do
          element :representative_dx_number_answer, :return_answer
        end
        section :representative_reference_row, :table_row_with_td_labelled, 'questions.representative_reference.label', exact: true do
          element :representative_reference_answer, :return_answer
        end
        section :representative_contact_preference_row, :table_row_with_td_labelled, 'questions.representative_contact_preference.label', exact: true do
          element :representative_contact_preference_answer, :return_answer
        end
        section :email_row, :table_row_with_td_labelled, 'questions.representative_contact_preference.email.input_label', exact: true do
          element :email_answer, :return_answer
        end
        section :fax_row, :table_row_with_td_labelled, 'questions.representative_contact_preference.fax.input_label', exact: true do
          element :fax_answer, :return_answer
        end
        element :edit_page_link, :link_named, 'links.confirmation_of_supplied_details.edit_page', exact: true
        
      end

      section :confirmation_of_disability_answers, :table_captioned, 'questions.confirmation_of_disability_answers.caption', exact: true do
        section :disability_row, :table_row_with_td_labelled, 'questions.disability.label', exact: true do
          element :disability_answer, :return_answer
        end
        section :disability_information_row, :table_row_with_td_labelled, 'questions.disability.disability_information.label', exact: true do
          element :disability_information_answer, :return_answer
        end
        element :edit_page_link, :link_named, 'links.confirmation_of_supplied_details.edit_page', exact: true
      end


      section :confirmation_of_employer_contract_claim_answers, :table_captioned, 'questions.confirmation_of_employer_contract_claim_answers.caption', exact: true do
        section :make_employer_contract_claim_row, :table_row_with_td_labelled, 'questions.make_employer_contract_claim.label', exact: true do
          element :make_employer_contract_claim_answer, :return_answer
        end
        section :claim_information_row, :table_row_with_td_labelled, 'questions.make_employer_contract_claim.claim_information.label', exact: true do
          element :claim_information_answer, :return_answer
        end
        element :edit_page_link, :link_named, 'links.confirmation_of_supplied_details.edit_page', exact: true
      end

      section :confirmation_of_additional_information_answers, :table_captioned, 'questions.confirmation_of_additional_information_answers.caption', exact: true do
        section :upload_additional_information_row, :table_row_with_td_labelled, 'questions.upload_additional_information.label', exact: true do
          element :upload_additional_information_answer, :return_answer
          element :remove_file_link, :link_named, 'components.confirmation_of_supplied_details.remove_file_link'
        end
        element :edit_page_link, :link_named, 'links.confirmation_of_supplied_details.edit_page', exact: true
      end
      
      element :continue_button, :submit_text, 'confirmation.submit'
      def submit_form
        continue_button.click
      end
    end
  end
end

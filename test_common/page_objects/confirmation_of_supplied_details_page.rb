module ET3
  module Test
    class ConfirmationOfSuppliedDetailsPage < BasePage
      set_url '/respond/confirmation_of_supplied_details'

      section :email_receipt_question, :inputtext_labelled, 'questions.email_receipt.label', exact: true do
        delegate :set, to: :root_element
      end

      section :confirm_email_receipt_question, :inputtext_labelled, 'questions.confirm_email_receipt.label', exact: true do
        delegate :set, to: :root_element
      end

      section :confirmation_of_respondents_details_answers, :table_captioned, 'questions.confirmation_of_respondents_details_answers.caption', exact: true do
        
        section :case_number_row, :table_row, 'questions.case_number.label', exact: true do
          element :case_number_answer, :return_answer
        end

        section :name_row, :table_row, 'questions.name.label', exact: true do
          element :name_answer, :return_answer
        end

        section :contact_row, :table_row, 'questions.contact.label', exact: true do
          element :contact_answer, :return_answer
        end

        section :building_name_row, :table_row, 'questions.building_name.label', exact: true do
          element :building_name_answer, :return_answer
        end

        section :street_row, :table_row, 'questions.street.label', exact: true do
          element :street_answer, :return_answer
        end

        section :town_row, :table_row, 'questions.town.label', exact: true do
          element :town_answer, :return_answer
        end

        section :county_row, :table_row, 'questions.county.label', exact: true do
          element :county_answer, :return_answer
        end

        section :postcode_row, :table_row, 'questions.postcode.label', exact: true do
          element :postcode_answer, :return_answer
        end

        section :dx_number_row, :table_row, 'questions.dx_number.label', exact: true do
          element :dx_number_answer, :return_answer
        end

        section :contact_number_row, :table_row, 'questions.contact_number.label', exact: true do
          element :contact_number_answer, :return_answer
        end

        section :mobile_number_row, :table_row, 'questions.contact_mobile_number.label', exact: true do
          element :mobile_number_answer, :return_answer
        end

        section :contact_preference_row, :table_row, 'questions.contact_preference.label', exact: true do
          element :contact_preference_answer, :return_answer
        end

        section :email_address_row, :table_row, 'questions.contact_preference.email.input_label', exact: true do
          element :email_address_answer, :return_answer
        end

        section :fax_number_row, :table_row, 'questions.contact_preference.fax.input_label', exact: true do
          element :fax_number_answer, :return_answer
        end

        section :organisation_employ_gb_row, :table_row, 'questions.organisation_employ_gb.label', exact: true do
          element :organisation_employ_gb_answer, :return_answer
        end

        section :organisation_more_than_one_site_row, :table_row, 'questions.organisation_more_than_one_site.label', exact: true do
          element :organisation_more_than_one_site_answer, :return_answer
        end

        section :employment_at_site_number_row, :table_row, 'questions.organisation_more_than_one_site.employment_at_site_number.label', exact: true do
          element :employment_at_site_number_answer, :return_answer
        end

      end
      
      section :confirmation_of_claimants_details_answers, :table_captioned, 'questions.confirmation_of_claimants_details_answers.caption', exact: true do

      end

      section :confirmation_of_earnings_and_benefits_answers, :table_captioned, 'questions.confirmation_of_earnings_and_benefits_answers.caption', exact: true do

      end

      section :confirmation_of_response_answers, :table_captioned, 'questions.confirmation_of_response_answers.caption', exact: true do

      end

      section :confirmation_of_your_representative_answers, :table_captioned, 'questions.confirmation_of_your_representative_answers.caption', exact: true do

      end

      section :confirmation_of_employer_contract_claim_answers, :table_captioned, 'questions.confirmation_of_employer_contract_claim_answers.caption', exact: true do

      end
      
      element :continue_button, :button, "Submit Form"
      def submit_form
        continue_button.click
      end
    end
  end
end

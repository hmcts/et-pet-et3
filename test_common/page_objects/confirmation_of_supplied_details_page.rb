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

      element :confirmation_of_respondents_details_answers, :table_captioned, 'questions.confirmation_of_respondents_details_answers.caption', exact: true
      element :confirmation_of_claimants_details_answers, :table_captioned, 'questions.confirmation_of_claimants_details_answers.caption', exact: true
      element :confirmation_of_earnings_and_benefits_answers, :table_captioned, 'questions.confirmation_of_earnings_and_benefits_answers.caption', exact: true
      element :confirmation_of_response_answers, :table_captioned, 'questions.confirmation_of_response_answers.caption', exact: true
      element :confirmation_of_your_representative_answers, :table_captioned, 'questions.confirmation_of_your_representative_answers.caption', exact: true
      element :confirmation_of_employer_contract_claim_answers, :table_captioned, 'questions.confirmation_of_employer_contract_claim_answers.caption', exact: true
      
      element :continue_button, :button, "Submit Form"
      def submit_form
        continue_button.click
      end
    end
  end
end

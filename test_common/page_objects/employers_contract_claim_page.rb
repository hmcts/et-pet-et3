module ET3
  module Test
    class EmployersContractClaimPage < BasePage
      set_url '/respond/employers_contract_claim'

      element :error_header, :error_titled, 'errors.header', exact: true

      section :make_employer_contract_claim_question, :single_choice_option, 'questions.make_employer_contract_claim.label', exact: true do

        include SingleChoiceOptionSection

        section :claim_information, :textarea_labelled, 'questions.make_employer_contract_claim.claim_information.label', exact: true do
          delegate :set, to: :root_element
        end

        element :error_too_long, :exact_error_text, 'errors.messages.too_long', exact: false

        def set_for(user_persona)
          choose(user_persona.make_employer_contract_claim)
          claim_information.set(user_persona.claim_information) if yes.has_checked_field?
        end
      end

      element :continue_button, :submit_text, 'components.save_and_continue_button'
      def next
        continue_button.click
      end
    end
  end
end

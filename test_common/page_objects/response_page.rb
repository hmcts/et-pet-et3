module ET3
  module Test
    class ResponsePage < BasePage
      set_url '/respond/response'

      element :error_header, :error_titled, 'errors.header', exact: true

      section :defend_claim_question, :single_choice_option, 'questions.defend_claim.label', exact: false do

        section :yes, :gds_multiple_choice_option, 'questions.defend_claim.yes.label', exact: true do
          element :selector, :css, 'input'

          delegate :set, to: :selector
        end

        section :no, :gds_multiple_choice_option, 'questions.defend_claim.no.label', exact: true do
          element :selector, :css, 'input'

          delegate :set, to: :selector
        end

        section :defend_claim_facts, :textarea_labelled, 'questions.defend_claim.defend_claim_facts.label', exact: false do
          delegate :set, to: :root_element
        end

        element :error_too_long, :exact_error_text, 'errors.messages.too_long', exact: false
        element :error_inclusion, :exact_error_text, 'errors.messages.inclusion', exact: false

        def set_for(user_persona)
          if user_persona.defend_claim == 'Yes'
            yes.set(true)
            defend_claim_facts.set(user_persona.defend_claim_facts)
          else
            no.set(true)
          end
        end
      end

      element :continue_button, :button, "Save and continue"
      def next
        continue_button.click
      end
    end
  end
end
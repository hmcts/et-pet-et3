module ET3
  module Test
    class ResponsePage < BasePage
      set_url '/respond/response'

      element :header, :content_header, 'response.header'

      element :error_header, :error_titled, 'errors.header', exact: true

      section :defend_claim_question, :single_choice_option, 'questions.defend_claim.label', exact: false do
        include SingleChoiceOptionSection

        section :defend_claim_facts, :textarea_labelled, 'questions.defend_claim.defend_claim_facts.label', exact: false do
          delegate :set, to: :root_element
        end

        element :error_too_long, :exact_error_text, 'errors.messages.too_long', exact: false
        element :error_inclusion, :exact_error_text, 'errors.messages.inclusion', exact: false

        def set_for(user_persona)
          choose(user_persona.defend_claim)
          defend_claim_facts.set(user_persona.defend_claim_facts) if yes.has_checked_field?
        end
      end

      element :continue_button, :submit_text, 'components.save_and_continue_button'
      def next
        continue_button.click
      end
    end
  end
end
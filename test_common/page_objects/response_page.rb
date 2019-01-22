module ET3
  module Test
    class ResponsePage < BasePage
      set_url '/respond/response'
      element :header, :content_header, 'response.header'
      element :error_header, :error_titled, 'errors.header', exact: true

      section :defend_claim_question, :single_choice_option, 'questions.defend_claim.label', exact: false do
        include ET3::Test::I18n

        element :yes, :gds_multiple_choice_option, 'questions.defend_claim.yes.label'
        element :no, :gds_multiple_choice_option, 'questions.defend_claim.no.label'

        section :defend_claim_facts, :textarea_labelled, 'questions.defend_claim.defend_claim_facts.label', exact: false do
          def set(*args); root_element.set(*args); end
        end

        element :error_too_long, :exact_error_text, 'errors.messages.too_long', exact: false
        element :error_inclusion, :exact_error_text, 'errors.messages.inclusion', exact: false

        def set_for(user_persona)
          choose(factory_translate(user_persona.defend_claim), name: 'response[defend_claim]')
          if t(user_persona.defend_claim) == t('questions.defend_claim.yes.label')
            defend_claim_facts.set(user_persona.defend_claim_facts)
          end
        end

        def assert_answers_for(user_persona)
          find(:gds_multiple_choice_option,
               user_persona.defend_claim).assert_selector(:field, nil, checked: true) &&

          if t(user_persona.defend_claim) == t('questions.defend_claim.yes.label')
            root_element.
                assert_selector(
                    :field,
                    t('questions.defend_claim.defend_claim_facts.label'),
                    with: user_persona.defend_claim_facts,
                    exact: false
                )
          end
        end
      end

      element :continue_button, :submit_text, 'components.save_and_continue_button'
      def next
        continue_button.click
      end
    end
  end
end
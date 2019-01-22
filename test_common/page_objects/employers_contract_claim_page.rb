module ET3
  module Test
    class EmployersContractClaimPage < BasePage
      set_url '/respond/employers_contract_claim'
      element :header, :content_header, 'employer_contract_claim.header'
      element :description, :element_with_text, 'employer_contract_claim.description'
      element :error_header, :error_titled, 'errors.header', exact: true

      section :make_employer_contract_claim_question, :single_choice_option, 'questions.make_employer_contract_claim.label', exact: true do
        include ET3::Test::I18n

        element :yes, :gds_multiple_choice_option, 'questions.make_employer_contract_claim.yes.label'
        element :no, :gds_multiple_choice_option, 'questions.make_employer_contract_claim.yes.label'

        section :claim_information, :textarea_labelled, 'questions.make_employer_contract_claim.claim_information.label', exact: true do
          def set(*args); root_element.set(*args); end
        end

        element :error_too_long, :exact_error_text, 'errors.messages.too_long', exact: false

        def set_for(user_persona)
          choose(factory_translate(user_persona.make_employer_contract_claim), name: 'employers_contract_claim[make_employer_contract_claim]')
          if t(user_persona.make_employer_contract_claim) == t('questions.make_employer_contract_claim.yes.label')
            claim_information.set(user_persona.claim_information)
          end
        end

        def assert_answers_for(user_persona)
          find(:gds_multiple_choice_option,
               user_persona.make_employer_contract_claim).assert_selector(:field, nil, checked: true) &&

          if t(user_persona.make_employer_contract_claim) == t('questions.make_employer_contract_claim.yes.label')
            root_element.
                assert_selector(
                    :field,
                    t('questions.make_employer_contract_claim.claim_information.label'),
                    with: user_persona.claim_information,
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

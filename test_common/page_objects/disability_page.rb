module ET3
  module Test
    class DisabilityPage < BasePage
      set_url '/respond/disability'
      element :header, :content_header, 'disability.header'
      element :error_header, :error_titled, 'errors.header', exact: true

      section :disability_question, :single_choice_option, 'questions.disability.label', exact: false do
        include ET3::Test::I18n

        element :yes, :gds_multiple_choice_option, 'questions.disability.yes.label'
        element :no, :gds_multiple_choice_option, 'questions.disability.no.label'

        section :disability_information, :textarea_labelled, 'questions.disability.disability_information.label', exact: :false do
          def set(*args); root_element.set(*args); end
        end

        element :error_too_long, :exact_error_text, 'errors.messages.too_long', exact: false

        def set_for(user_persona)
          choose(factory_translate(user_persona.disability), name: 'disability[disability]')
          if t(user_persona.disability) == t('questions.disability.yes.label') && user_persona.disability_information != nil
            disability_information.set(user_persona.disability_information)
          end
        end

        def assert_answers_for(user_persona)
          find(:gds_multiple_choice_option,
               user_persona.disability).assert_selector(:field, nil, checked: true) &&

          if t(user_persona.disability) == t('questions.disability.yes.label')
            root_element.
                assert_selector(
                    :field,
                    t('questions.disability.disability_information.label'),
                    with: user_persona.disability_information,
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
module ET3
  module Test
    class DisabilityPage < BasePage
      set_url '/respond/disability'
      element :error_header, :error_titled, 'errors.header', exact: true
      section :disability_question, :single_choice_option, 'questions.disability.label', exact: false do
        include ET3::Test::I18n
        element :yes, :gds_multiple_choice_option, 'questions.disability.yes.label' do
          element :selector, :css, 'input[type="radio"]'
          def set(*args); selector.set(*args); end
        end
        element :no, :gds_multiple_choice_option, 'questions.disability.no.label' do
          element :selector, :css, 'input[type="radio"]'
          def set(*args); selector.set(*args); end
        end
        section :disability_information, :textarea_labelled, 'questions.disability.disability_information.label', exact: :false do
          delegate :set, to: :root_element
        end
        element :error_too_long, :exact_error_text, 'errors.messages.too_long', exact: false
        def set_for(user_persona)
          choose(factory_translate(user_persona.disability), name: 'disability[disability]')
          if t(user_persona.disability) == t('questions.disability.yes.label') && user_persona.disability_information != nil
            disability_information.set(user_persona.disability_information)
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
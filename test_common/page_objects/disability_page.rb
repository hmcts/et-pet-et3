module ET3
  module Test
    class DisabilityPage < BasePage
      set_url '/respond/disability'

      element :error_header, :error_titled, 'errors.header', exact: true

      section :disability_question, :single_choice_option, 'questions.disability.label', exact: false do

        include SingleChoiceOptionSection

        section :disability_information, :textarea_labelled, 'questions.disability.disability_information.label', exact: :false do
          delegate :set, to: :root_element
        end

        element :error_too_long, :exact_error_text, 'errors.messages.too_long', exact: false

        def set_for(user_persona)
          if user_persona.disability == "Yes"
            yes.set(true)
            disability_information.set(user_persona.disability_information)
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
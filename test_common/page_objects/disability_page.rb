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
          choose(user_persona.disability)
          disability_information.set(user_persona.disability_information) if yes.has_checked_field?
        end
      end

      element :continue_button, :button, "Save and continue"
      def next
        continue_button.click
      end
    end
  end
end
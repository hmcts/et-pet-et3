module ET3
  module Test
    class RegistrationPage < BasePage
      set_url '/users/sign_up'
      element :header, :content_header, 'respondents_details.header'
      element :error_header, :error_titled, 'errors.header', exact: true
      section :email_question, :question_labelled, 'questions.email.label', exact: false do
        element :field, :css, "input"
        element :error_invalid, :exact_error_text, 'errors.messages.invalid', exact: false
        def set(*args); field.set(*args); end
      end
      section :memorable_word_question, :question_labelled, 'questions.memorable_word.label', exact: false do
        element :field, :css, "input"
        element :error_memorable_word, :exact_error_text, 'errors.custom.memorable_word', exact: false
        def set(*args); field.set(*args); end
      end

      section :save_and_return_number, :save_and_return_number_panel, 'questions.save_and_return_number.label', exact: false do
        element :value, :css, '.reference-number'
      end

      element :continue_button, :submit_text, 'components.save_and_continue_button'
      def next
        continue_button.click
      end
    end
  end
end
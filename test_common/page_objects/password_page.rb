module ET3
  module Test
    class PasswordPage < BasePage
      set_url '/users/password/new'
      element :header, :content_header, 'respondents_details.header'
      element :error_header, :error_titled, 'errors.header', exact: true
      section :email_address_question, :question_labelled, 'questions.email_address.label', exact: false do
        element :field, :css, "input"
        element :error_password_email_address, :exact_error_text, 'errors.custom.password_email_address', exact: false
        def set(*args); field.set(*args); end
      end
      section :reference_number_question, :question_labelled, 'questions.reference.label', exact: false do
        element :field, :css, "input"
        def set(*args); field.set(*args); end
      end

      element :reset_memorable_word, :submit_text, "components.reset_memorable_word_button"
      def next
        reset_memorable_word.click
      end
    end
  end
end
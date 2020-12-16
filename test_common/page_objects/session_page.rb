module ET3
  module Test
    class SessionPage < BasePage
      set_url '/users/sign_in'
      element :header, :content_header, 'respondents_details.header'
      element :error_header, :error_titled, 'errors.header', exact: true
      section :reference_number_question, :question_labelled, 'questions.reference.label', exact: false do
        element :field, :css, "input"
        element :error_invalid, :exact_error_text, 'errors.messages.invalid', exact: false
        def set(*args); field.set(*args); end
      end
      section :memorable_word_question, :question_labelled, 'questions.memorable_word_session.label', exact: false do
        element :field, :css, "input"
        element :error_blank, :exact_error_text, 'errors.messages.blank', exact: false
        def set(*args); field.set(*args); end
      end

      element :continue_button, :submit_text, 'components.find_my_response_button'
      element :click_here_to_reset, :link_named, "components.click_here_to_reset"
      def next
        continue_button.click
      end

      def reset_password
        click_here_to_reset.click
      end
    end
  end
end
module ET3
  module Test
    class RegistrationPage < BasePage
      include EtTestHelpers::Page
      set_url '/users/sign_up'
      element :header, :content_header, 'respondents_details.header'
      element :error_header, :error_titled, 'errors.header', exact: true

      gds_text_input :email_question, :'questions.email.label', exact: false
      gds_text_input :memorable_word_question, :'questions.memorable_word.label', exact: false

      section :save_and_return_number, :save_and_return_number_panel, 'questions.save_and_return_number.label', exact: false do
        element :value, :css, '.reference-number'
      end

      gds_submit_button :continue_button, :'components.save_and_continue_button'
      def next
        continue_button.click
      end
    end
  end
end

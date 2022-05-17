module ET3
  module Test
    class PasswordPage < BasePage
      include EtTestHelpers::Page
      set_url '/users/password/new'
      element :header, :content_header, 'respondents_details.header'
      element :error_header, :error_titled, 'errors.header', exact: true
      gds_text_input :email_address_question, :'questions.email_address.label', exact: false
      gds_text_input :reference_number_question, :'questions.reference.label', exact: false

      gds_submit_button :reset_memorable_word, :'components.reset_memorable_word_button'
      def next
        reset_memorable_word.click
      end
    end
  end
end

module ET3
  module Test
    class SessionPage < BasePage
      include EtTestHelpers::Page
      set_url '/users/sign_in'
      element :header, :content_header, 'respondents_details.header'
      element :error_header, :error_titled, 'errors.header', exact: true
      gds_text_input :reference_number_question, :'questions.reference.label', exact: false
      gds_text_input :memorable_word_question, :'questions.memorable_word_session.label', exact: false

      gds_submit_button :continue_button, :'components.find_my_response_button'
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

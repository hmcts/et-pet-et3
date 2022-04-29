module ET3
  module Test
    class ResponsePage < BasePage
      include EtTestHelpers::Page
      set_url '/respond/response'
      element :header, :content_header, 'response.header'
      element :error_header, :error_titled, 'errors.header', exact: true

      gds_radios :defend_claim_question, :'questions.responses.defend_claim', exact: false
      gds_text_area :defend_claim_facts, :'questions.responses.defend_claim_facts', exact: false

      gds_submit_button :continue_button, :'components.save_and_continue_button'
      def next
        continue_button.click
      end
    end
  end
end

module ET3
  module Test
    class DisabilityPage < BasePage
      include EtTestHelpers::Page
      set_url '/respond/disability'
      element :header, :content_header, 'disability.header'
      element :error_header, :error_titled, 'errors.header', exact: true

      gds_radios :disability_question, :'questions.disabilities.disability', exact: false
      gds_text_area :disability_information, :'questions.disabilities.disability_information', exact: :false

      gds_submit_button :continue_button, :'components.save_and_continue_button'
      def next
        continue_button.click
      end
    end
  end
end

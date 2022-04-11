module ET3
  module Test
    class YourRepresentativePage < BasePage
      include EtTestHelpers::Page
      set_url '/respond/your_representative'
      element :header, :content_header, 'your_representative.header'


      gds_radios :have_representative_question, :'questions.your_representatives.have_representative', exact: true

      gds_submit_button :continue_button, :'components.save_and_continue_button'
      def next
        continue_button.click
      end
    end
  end
end

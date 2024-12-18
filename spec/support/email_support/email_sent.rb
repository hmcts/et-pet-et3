module ET3
  module Test
    class EmailsSent
      def initialize(deliveries: ActionMailer::Base.deliveries)
        self.deliveries = deliveries
      end

      def empty?
        deliveries.empty?
      end

      def new_reference_number_html_email_for(reference:)
        email = ET3::Test::EmailObjects::NewReferenceNumberEmailHtml.find(reference: reference)
        raise "No HTML response (ET3) email has been sent for reference #{reference}" if email.blank?

        email
      end

      def new_reference_number_text_email_for(reference:, template_reference:)
        email = EtApi::Test::EmailObjects::NewReferenceNumberEmailText.find(reference: reference, template_reference: template_reference)
        raise "No text response (ET3) email has been sent for reference #{reference} using template reference #{template_reference}" if email.blank?

        email
      end

      private

      attr_accessor :deliveries
    end
  end
end

module ET3
  module Test
    class AdditionalInformationPage < BasePage
      set_url '/respond/additional_information'

      element :error_header, :error_titled, 'errors.header', exact: true

      section :upload_additional_information_question, :css, 'form.upload-additional-file' do
        include ET3::Test::I18n
        
        element :upload_select, :button, t('questions.upload_additional_information.label')

        element :error_too_long, :exact_error_text, 'errors.messages.too_long', exact: false
        element :error_inclusion, :exact_error_text, 'errors.messages.inclusion', exact: false

        delegate :set, to: :upload_select
      end

      element :continue_button, :button, "Save and continue"
      def next
        continue_button.click
      end
    end
  end
end

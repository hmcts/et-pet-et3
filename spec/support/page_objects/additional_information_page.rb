require_relative '../helpers/upload_helper'
module ET3
  module Test
    class AdditionalInformationPage < BasePage
      include ET3::Test::UploadHelper
      include EtTestHelpers::Page
      set_url '/respond/additional_information'

      element :header, :content_header, 'additional_information.header'
      element :description, :element_with_text, 'additional_information.description'

      element :error_header, :error_titled, 'errors.header', exact: true

      # @!method upload_file_question
      #   A govuk file field component wrapping the input, label, hint etc.. for the upload file question
      #   @return [EtTestHelpers::Components::GovUKFileDropzoneField] The site prism section
      gds_file_dropzone_upload :upload_additional_information_question, :'questions.additional_informations.upload_additional_information'

      gds_submit_button :continue_button, :'components.save_and_continue_button'
      def next
        continue_button.click
      end

      def attach_additional_information_file(respondent)
        data = respondent.to_h
        return if respondent.nil?
        if data.key?(:rtf_file)
          upload_additional_information_question.set(Rails.root.join('spec', 'support', 'files', data[:rtf_file]))
        end
        page.has_content?('Remove file')
      end
    end
  end
end

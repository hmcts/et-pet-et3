require_relative '../helpers/upload_helper'
module ET3
  module Test
    class AdditionalInformationPage < BasePage
      include ET3::Test::UploadHelper
      set_url '/respond/additional_information'

      element :header, :content_header, 'additional_information.header'
      element :description, :element_with_text, 'additional_information.description'

      element :error_header, :error_titled, 'errors.header', exact: true

      section :upload_additional_information_question, :css, 'form.dropzone' do
        include ET3::Test::I18n
        
        element :upload_select, :select_button, 'questions.upload_additional_information.button'

        element :error_too_long, :exact_error_text, 'errors.messages.too_long', exact: false
        element :error_inclusion, :exact_error_text, 'errors.messages.inclusion', exact: false

        delegate :set, to: :upload_select
      end

      element :continue_button, :submit_text, 'components.save_and_continue_button'
      def next
        continue_button.click
      end

      def attach_additional_information_file(respondent)
        data = respondent.to_h
        return if respondent.nil?
        if data.key?(:rtf_file)
          page.execute_script <<-JS
            fakeFileInput = window.$('<input/>').attr(
              {id: 'fakeFileInput', type:'file'}
            ).appendTo('body');
          JS

          force_remote do
            attach_file("fakeFileInput", Rails.root.join('test_common', 'files', data[:rtf_file]))
          end
          page.execute_script("var fileList = [fakeFileInput.get(0).files[0]]")
          page.execute_script <<-JS
            var e = jQuery.Event('drop', { dataTransfer : { files : [fakeFileInput.get(0).files[0]] } });
            $('.dropzone')[0].dropzone.listeners[0].events.drop(e);
          JS
        end
        sleep 2
        page.has_content?('Remove file')
      end
    end
  end
end

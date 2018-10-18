require_relative '../helpers/upload_helper'
module ET3
  module Test
    class AdditionalInformationPage < BasePage
      include ET3::Test::UploadHelper
      set_url '/respond/additional_information'

      element :error_header, :error_titled, 'errors.header', exact: true

      section :upload_additional_information_question, :css, 'form.dropzone' do
        include ET3::Test::I18n
        
        element :upload_select, :select_button, 'questions.upload_additional_information.button'

        element :error_too_long, :exact_error_text, 'errors.messages.too_long', exact: false
        element :error_inclusion, :exact_error_text, 'errors.messages.inclusion', exact: false

        delegate :set, to: :upload_select
      end

      element :continue_button, :button, "Save and continue"
      def next
        continue_button.click
      end

      def attach_additional_information_file(user)
        # Source: https://stackoverflow.com/questions/32880524/how-do-you-test-uploading-a-file-with-capybara-and-dropzone-js

        # Generate a fake input selector
        page.execute_script <<-JS
            fakeFileInput = window.$('<input/>').attr(
              {id: 'fakeFileInput', type:'file'}
            ).appendTo('body');
        JS
        # Attach the file to the fake input selector
        force_remote do
          attach_file("fakeFileInput", Rails.root.join('test_common', 'files', user.upload_additional_information))
        end
        # Add the file to a fileList array
        page.execute_script("var fileList = [fakeFileInput.get(0).files[0]]")
        # Trigger the fake drop event
        page.execute_script <<-JS
            var e = jQuery.Event('drop', { dataTransfer : { files : [fakeFileInput.get(0).files[0]] } });
            $('.dropzone')[0].dropzone.listeners[0].events.drop(e);
        JS
      end
    end
  end
end

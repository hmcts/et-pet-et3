# TODO: Refactor so as not to use CSS selectors
module ET3
  module Test
    class FormSubmissionPage < BasePage
      set_url '/respond/form_submission'

      element :submission_confirmation, :css, '.submission-confirmation'

      element :reference_number, :css, '.reference-number'

      element :download_pdf, :css, '.download-pdf'

      element :return_to_govuk_button, :css, 'a.button.button-start'
      def return
        return_to_govuk_button.click
      end
    end
  end
end

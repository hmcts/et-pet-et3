module ET3
  module Test
    class FormSubmissionPage < BasePage
      set_url '/respond/form_submission'

      element :submission_confirmation, :css, '.submission-confirmation'

      element :reference_number, :css, '.reference-number'

      element :download_pdf, :css, '.download-pdf'

      element :govuk_button, :css, 'a.button.button-start'
      def finish
        govuk_button.click
      end
    end
  end
end

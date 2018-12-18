module ET3
  module Test
    class FormSubmissionPage < BasePage
      set_url '/respond/form_submission'
      element :submission_confirmation, :element_with_text, 'submission.confirmation'
      element :reference_number, :element_with_text, 'submission.reference'
      element :thank_you, :element_with_text, 'submission.thank_you'
      element :office_contact, :element_with_text, 'submission.office_contact'
      element :submission_date, :element_with_text, 'submission.date', exact: false
      element :valid_pdf_download, :link_named, 'links.form_submission.valid_pdf_download'
      element :invalid_pdf_download, :link_named, 'links.form_submission.invalid_pdf_download'
      element :return_to_govuk_button, :link_named, 'submission.return_link'
      def return
        return_to_govuk_button.click
      end
    end
  end
end

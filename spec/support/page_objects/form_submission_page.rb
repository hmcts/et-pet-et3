module ET3
  module Test
    class FormSubmissionPage < BasePage
      set_url '/respond/form_submission'
      element :submission_confirmation, :element_with_text, 'submission.confirmation'
      element :reference_number, :element_with_text, 'submission.reference'
      element :copy_sent, :paragraph_with_text, 'submission.copy_sent', exact: false
      element :office_contact, :element_with_text, 'submission.office_contact'
      element :submission_date, :summary_list_row_labelled, 'submission.date', exact: false
      element :valid_pdf_download, :link_named, 'links.form_submission.valid_pdf_download'
      element :invalid_pdf_download, :link_named, 'links.form_submission.invalid_pdf_download'
      element :return_to_govuk_button, :link_named, 'submission.return_link'
      def return
        return_to_govuk_button.click
      end

      def assert_copy_sent(respondent)
        if respondent.contact_preference.to_s.split('.')[-2] == 'email'
          expect(copy_sent).to have_text(respondent.email_address)
        end
      end
    end
  end
end

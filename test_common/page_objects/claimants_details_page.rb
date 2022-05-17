module ET3
  module Test
    class ClaimantsDetailsPage < BasePage
      include EtTestHelpers::Page
      set_url '/respond/claimants_details'

      element :header, :content_header, 'claimants_details.header'

      element :error_header, :error_titled, 'errors.header', exact: true

      gds_text_input :claimants_name_question, :'questions.claimants_details.claimants_name', exact: false

      gds_radios :agree_with_early_conciliation_details_question, :'questions.claimants_details.agree_with_early_conciliation_details'
      gds_text_area :disagree_conciliation_reason, :'questions.claimants_details.disagree_conciliation_reason', exact: false
      gds_radios :agree_with_employment_dates_question, :'questions.claimants_details.agree_with_employment_dates', exact: false
      gds_date_input :employment_start, :'questions.claimants_details.employment_start', exact: false
      gds_date_input :employment_end, :'questions.claimants_details.employment_end', exact: false
      gds_text_area :disagree_employment, :'questions.claimants_details.disagree_employment', exact: false
      gds_radios :continued_employment_question, :'questions.claimants_details.continued_employment', exact: false
      gds_radios :agree_with_claimants_description_of_job_or_title_question, :'questions.claimants_details.agree_with_claimants_description_of_job_or_title'
      gds_text_area :disagree_claimants_job_or_title, :'questions.claimants_details.disagree_claimants_job_or_title', exact: false
      gds_submit_button :continue_button, :'components.save_and_continue_button'
      def next
        continue_button.click
      end
    end
  end
end

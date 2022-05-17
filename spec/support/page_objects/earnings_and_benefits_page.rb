module ET3
  module Test
    class EarningsAndBenefitsPage < BasePage
      include EtTestHelpers::Page
      set_url '/respond/earnings_and_benefits'
      element :header, :content_header, 'earnings_and_benefits.header'
      element :error_header, :error_titled, 'errors.header', exact: true

      gds_radios :agree_with_claimants_hours_question, :'questions.earnings_and_benefits.agree_with_claimants_hours', exact: false
      gds_text_input :queried_hours, :'questions.earnings_and_benefits.queried_hours', exact: false
      gds_radios :agree_with_earnings_details_question, :'questions.earnings_and_benefits.agree_with_earnings_details', exact: false
      gds_text_input :queried_pay_before_tax, :'questions.earnings_and_benefits.queried_pay_before_tax', exact: true
      gds_radios :queried_pay_before_tax_period, :'questions.earnings_and_benefits.queried_pay_before_tax_period'
      gds_text_input :queried_take_home_pay, :'questions.earnings_and_benefits.queried_take_home_pay'
      gds_radios :queried_take_home_pay_period, :'questions.earnings_and_benefits.queried_take_home_pay_period'
      gds_radios :agree_with_claimant_notice_question, :'questions.earnings_and_benefits.agree_with_claimant_notice', exact: false
      gds_text_area :disagree_claimant_notice_reason, :'questions.earnings_and_benefits.disagree_claimant_notice_reason', exact: false
      gds_radios :agree_with_claimant_pension_benefits_question, :'questions.earnings_and_benefits.agree_with_claimant_pension_benefits', exact: false
      gds_text_area :disagree_claimant_pension_benefits_reason, :'questions.earnings_and_benefits.disagree_claimant_pension_benefits_reason', exact: false
      gds_submit_button :continue_button, :'components.save_and_continue_button'
      def next
        continue_button.click
      end
    end
  end
end

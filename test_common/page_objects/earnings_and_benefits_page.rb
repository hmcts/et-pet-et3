module ET3
  module Test
    class EarningsAndBenefitsPage < BasePage
      set_url '/respond/earnings_and_benefits'

      element :header, :content_header, 'earnings_and_benefits.header'

      element :error_header, :error_titled, 'errors.header', exact: true

      section :agree_with_claimants_hours_question, :single_choice_option, 'questions.agree_with_claimants_hours.label', exact: false do

        include SingleChoiceOptionSection

        section :queried_hours, :question_labelled, 'questions.agree_with_claimants_hours.queried_hours.label', exact: false do
          element :field, :css, 'input'

          delegate :set, to: :field
        end

        element :error_not_a_number, :exact_error_text, 'errors.custom.queried_hours.not_a_number', exact: false

        def set_for(user_persona)
          choose(user_persona.agree_with_claimants_hours)
          queried_hours.set(user_persona.queried_hours) if no.has_checked_field?
        end
      end

      section :agree_with_earnings_details_question, :single_choice_option, 'questions.agree_with_earnings_details.label', exact: false do

        include SingleChoiceOptionSection

        section :queried_pay_before_tax, :embedded_single_choice_option, 'questions.agree_with_earnings_details.queried_pay_before_tax_period.label', exact: true do
          
          section :field, :inputtext_labelled, 'questions.agree_with_earnings_details.queried_pay_before_tax.label', exact: false do
            delegate :set, to: :root_element
          end

          section :monthly, :gds_multiple_choice_option, 'questions.agree_with_earnings_details.queried_pay_before_tax_period.monthly.label', exact: true do
            element :selector, :css, 'input'

            delegate :set, to: :selector
          end

          section :weekly, :gds_multiple_choice_option, 'questions.agree_with_earnings_details.queried_pay_before_tax_period.weekly.label', exact: true do
            element :selector, :css, 'input'

            delegate :set, to: :selector
          end

          element :error_not_a_number, :exact_error_text, 'errors.custom.queried_pay_before_tax.not_a_number', exact: false
          delegate :set, to: :field

        end

        section :queried_take_home_pay, :embedded_single_choice_option, 'questions.agree_with_earnings_details.queried_take_home_pay_period.label', exact: false do

          section :field, :inputtext_labelled, 'questions.agree_with_earnings_details.queried_take_home_pay.label', exact: false do
            delegate :set, to: :root_element
          end
          
          section :monthly, :gds_multiple_choice_option, 'questions.agree_with_earnings_details.queried_take_home_pay_period.monthly.label', exact: true do
            element :selector, :css, 'input'

            delegate :set, to: :selector
          end

          section :weekly, :gds_multiple_choice_option, 'questions.agree_with_earnings_details.queried_take_home_pay_period.weekly.label', exact: true do
            element :selector, :css, 'input'

            delegate :set, to: :selector
          end

          element :error_not_a_number, :exact_error_text, 'errors.custom.queried_take_home_pay.not_a_number', exact: false

          delegate :set, to: :field
        end
        
        def set_for(user_persona)
          choose(user_persona.agree_with_earnings_details)
          if no.has_checked_field?
            queried_pay_before_tax.set(user_persona.queried_pay_before_tax)
            queried_pay_before_tax.choose(user_persona.queried_pay_before_tax_period)
            queried_take_home_pay.set(user_persona.queried_take_home_pay)
            queried_take_home_pay.choose(user_persona.queried_take_home_pay_period)
          end
        end
      end

      section :agree_with_claimant_notice_question, :single_choice_option, 'questions.agree_with_claimant_notice.label', exact: false do

        include SingleChoiceOptionSection

        section :disagree_claimant_notice_reason, :textarea_labelled, 'questions.agree_with_claimant_notice.disagree_claimant_notice_reason.label', exact: false do
          delegate :set, to: :root_element
        end

        element :error_too_long, :exact_error_text, 'errors.messages.too_long', exact: false

        def set_for(user_persona)
          choose(user_persona.agree_with_claimant_notice)
          disagree_claimant_notice_reason.set(user_persona.disagree_claimant_notice_reason) if no.has_checked_field?
        end
      end

      section :agree_with_claimant_pension_benefits_question, :single_choice_option, 'questions.agree_with_claimant_pension_benefits.label', exact: false do

        include SingleChoiceOptionSection

        section :disagree_claimant_pension_benefits_reason, :textarea_labelled, 'questions.agree_with_claimant_pension_benefits.disagree_claimant_pension_benefits_reason.label', exact: false do
          delegate :set, to: :root_element
        end

        element :error_too_long, :exact_error_text, 'errors.messages.too_long', exact: false

        def set_for(user_persona)
          choose(user_persona.agree_with_claimant_pension_benefits)
          disagree_claimant_pension_benefits_reason.set(user_persona.disagree_claimant_pension_benefits_reason) if no.has_checked_field?
        end

      end

      element :continue_button, :submit_text, 'components.save_and_continue_button'
      def next
        continue_button.click
      end
    end
  end
end

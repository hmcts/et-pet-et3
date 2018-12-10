module ET3
  module Test
    class EarningsAndBenefitsPage < BasePage
      set_url '/respond/earnings_and_benefits'

      element :error_header, :error_titled, 'errors.header', exact: true

      # TODO - Earnings and Benefits
      # Are the claimant's hours of work correct? (optional)
      section :agree_with_claimants_hours_question, :single_choice_option, 'questions.agree_with_claimants_hours.label', exact: false do
        include ET3::Test::I18n
        element :yes, :gds_multiple_choice_option, 'questions.agree_with_claimants_hours.yes.label' do
          element :selector, :css, 'input[type="radio"]'
          def set(*args); selector.set(*args); end
        end
        element :no, :gds_multiple_choice_option, 'questions.agree_with_claimants_hours.no.label' do
          element :selector, :css, 'input[type="radio"]'
          def set(*args); selector.set(*args); end
        end
        # Please enter the details you believe to be correct (optional)
        section :queried_hours, :question_labelled, 'questions.agree_with_claimants_hours.queried_hours.label', exact: false do
          # TODO - In hours per week. For example, 39
          element :field, :css, 'input'
          delegate :set, to: :field
        end
        element :error_not_a_number, :exact_error_text, 'errors.custom.queried_hours.not_a_number', exact: false
        def set_for(user_persona)
          choose(factory_translate(user_persona.agree_with_claimants_hours), name: 'earnings_and_benefits[agree_with_claimants_hours]')
          if (user_persona.queried_hours)
            queried_hours.set(user_persona.queried_hours)
          end
        end
      end

      # Are the earnings details given by the claimant correct? (optional)
      section :agree_with_earnings_details_question, :single_choice_option, 'questions.agree_with_earnings_details.label', exact: false do
        include ET3::Test::I18n
        # TODO - If No, please give the details you believe to be correct 
        element :yes, :gds_multiple_choice_option, 'questions.agree_with_earnings_details.yes.label' do
          element :selector, :css, 'input[type="radio"]'
          def set(*args); selector.set(*args); end
        end
        element :no, :gds_multiple_choice_option, 'questions.agree_with_earnings_details.no.label' do
          element :selector, :css, 'input[type="radio"]'
          def set(*args); selector.set(*args); end
        end

        section :queried_pay_before_tax, :embedded_single_choice_option, 'questions.agree_with_earnings_details.queried_pay_before_tax_period.label', exact: true do
          section :field, :inputtext_labelled, 'questions.agree_with_earnings_details.queried_pay_before_tax.label', exact: false do
            def set(*args); root_element.set(*args); end
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
            def set(*args); root_element.set(*args); end
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
          choose(factory_translate(user_persona.agree_with_earnings_details), name: 'earnings_and_benefits[agree_with_earnings_details]')
          if t(user_persona.agree_with_earnings_details) == 'No'
            queried_pay_before_tax.set(user_persona.queried_pay_before_tax)
            queried_pay_before_tax.monthly.set(user_persona.queried_pay_before_tax_period)
            queried_take_home_pay.set(user_persona.queried_take_home_pay)
            queried_take_home_pay.monthly.set(user_persona.queried_take_home_pay_period)
          end
        end
      end

      section :agree_with_claimant_notice_question, :single_choice_option, 'questions.agree_with_claimant_notice.label', exact: false do
        include ET3::Test::I18n
        element :yes, :gds_multiple_choice_option, 'questions.agree_with_claimant_notice.yes.label' do
          element :selector, :css, 'input[type="radio"]'
          def set(*args); selector.set(*args); end
        end
        element :no, :gds_multiple_choice_option, 'questions.agree_with_claimant_notice.no.label' do
          element :selector, :css, 'input[type="radio"]'
          def set(*args); selector.set(*args); end
        end
        section :disagree_claimant_notice_reason, :textarea_labelled, 'questions.agree_with_claimant_notice.disagree_claimant_notice_reason.label', exact: false do
          def set(*args); root_element.set(*args); end
        end
        element :error_too_long, :exact_error_text, 'errors.messages.too_long', exact: false
        def set_for(user_persona)
          choose(factory_translate(user_persona.agree_with_claimant_notice), name: 'earnings_and_benefits[agree_with_claimant_notice]')
          if t(user_persona.agree_with_claimant_notice) == 'No'
            disagree_claimant_notice_reason.set(user_persona.disagree_claimant_notice_reason)
          end
        end
      end

      section :agree_with_claimant_pension_benefits_question, :single_choice_option, 'questions.agree_with_claimant_pension_benefits.label', exact: false do
        include ET3::Test::I18n
        element :yes, :gds_multiple_choice_option, 'questions.agree_with_claimant_pension_benefits.yes.label' do
          element :selector, :css, 'input[type="radio"]'
          def set(*args); selector.set(*args); end
        end
        element :no, :gds_multiple_choice_option, 'questions.agree_with_claimant_pension_benefits.no.label' do
          element :selector, :css, 'input[type="radio"]'
          def set(*args); selector.set(*args); end
        end
        section :disagree_claimant_pension_benefits_reason, :textarea_labelled, 'questions.agree_with_claimant_pension_benefits.disagree_claimant_pension_benefits_reason.label', exact: false do
          def set(*args); root_element.set(*args); end
        end
        element :error_too_long, :exact_error_text, 'errors.messages.too_long', exact: false
          def set_for(user_persona)
            choose(factory_translate(user_persona.agree_with_claimant_pension_benefits), name: 'earnings_and_benefits[agree_with_claimant_pension_benefits]')
            if t(user_persona.agree_with_claimant_pension_benefits) == 'No'
              disagree_claimant_pension_benefits_reason.set(user_persona.disagree_claimant_pension_benefits_reason)
            end
          end
      end
      element :continue_button, :button, "Save and continue"
      def next
        continue_button.click
      end
    end
  end
end
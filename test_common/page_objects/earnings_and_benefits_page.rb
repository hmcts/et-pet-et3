module ET3
  module Test
    class EarningsAndBenefitsPage < BasePage
      set_url '/respond/earnings_and_benefits'

      section :agree_with_claimants_hours_question, :single_choice_option, 'questions.agree_with_claimants_hours.label', exact: true do

        section :yes, :gds_multiple_choice_option, 'questions.agree_with_claimants_hours.yes.label', exact: true do
          element :selector, :css, 'input'

          delegate :set, to: :selector
        end

        section :no, :gds_multiple_choice_option, 'questions.agree_with_claimants_hours.no.label', exact: true do
          element :selector, :css, 'input'

          delegate :set, to: :selector
        end

        section :queried_hours, :inputtext_labelled, 'questions.agree_with_claimants_hours.queried_hours.label', exact: true do
          delegate :set, to: :root_element
        end

        def set_for(user_persona)
          if user_persona.agree_with_claimants_hours == 'No'
            no.set(true)
            queried_hours.set(user_persona.queried_hours)
          else
            yes.set(true)
          end
        end
      end

      section :agree_with_earnings_details_question, :single_choice_option, 'questions.agree_with_earnings_details.label', exact: true do

        section :yes, :gds_multiple_choice_option, 'questions.agree_with_earnings_details.yes.label', exact: true do
          element :selector, :css, 'input'

          delegate :set, to: :selector
        end

        section :no, :gds_multiple_choice_option, 'questions.agree_with_earnings_details.no.label', exact: true do
          element :selector, :css, 'input'

          delegate :set, to: :selector
        end

        section :queried_pay_before_tax, :inputtext_labelled, 'questions.agree_with_earnings_details.queried_pay_before_tax.label', exact: true do
          delegate :set, to: :root_element
        end

        #TODO: Build selector
        section :queried_pay_before_tax_period, :SELECTOR_HERE, 'questions.agree_with_earnings_details.queried_pay_before_tax_period.label', exact: true do
          delegate :set, to: :root_element
        end

        section :queried_take_home_pay, :inputtext_labelled, 'questions.agree_with_earnings_details.queued_take_home_pay.label', exact: true do
          delegate :set, to: :root_element
        end

        #TODO: Build selector
        section :queried_take_home_pay_period, :SELECTOR_HERE, 'questions.agree_with_earnings_details.queued_take_home_pay_period.label', exact: true do
          delegate :set, to: :root_element
        end

        def set_for(user_persona)
          if user_persona.agree_with_earnings_details == 'No'
            no.set(true)
            queried_pay_before_tax.set(user_persona.queried_pay_before_tax)
            queried_pay_before_tax_period.set(user_persona.queried_pay_before_tax_period)
            queried_take_home_pay.set(user_persona.queried_take_home_pay)
            queried_take_home_pay_period.set(user_persona.queried_take_home_pay_period)
          else
            yes.set(true)
          end
        end
      end

      section :agree_with_claimant_notice_question, :single_choice_option, 'questions.agree_with_claimant_notice_question.label', exact: true do

        section :yes, :gds_multiple_choice_option, 'question.agree_with_claimant_notice_question.yes.label', exact: true do
          element :selector, :css, 'input'

          delegate :set, to: :selector
        end

        section :no, :gds_multiple_choice_option, 'question.agree_with_claimant_notice_question.no.label', exact: true do
          element :selector, :css, 'input'

          delegate :set, to: :selector
        end

        section :disagree_claimant_notice_reason, :textarea_labelled, 'questions.agree_with_claimants_hours.disagree_claimant_notice_reason.label', exact: true do
          delegate :set, to: :root_element
        end

        def set_for(user_persona)
          if user_persona.agree_with_claimant_notice_question == 'No'
            no.set(true)
            disagree_claimant_notice_reason.set(user_persona.disagree_claimant_notice_reason)
          else
            yes.set(true)
          end
        end
      end

      section :agree_with_claimant_pension_benefits_question, :single_choice_option, 'questions.agree_with_claimant_pension_benefits.label', exact: true do
        
        section :yes, :gds_multiple_choice_option, 'question.agree_with_claimant_pension_benefits.yes.label', exact: true do
          element :selector, :css, 'input'

          delegate :set, to: :selector
        end

        section :no, :gds_multiple_choice_option, 'question.agree_with_claimant_pension_benefits.no.label', exact: true do
          element :selector, :css, 'input'

          delegate :set, to: :selector
        end

        section :disagree_claimant_pension_benefits_reason, :textarea_labelled, 'question.agree_with_claimant_pension_benefits.disagree claimant_pension_benefits_reason.label', exact: true do
          delegate :set, to: :root_element
        end

        def set_for(user_persona)
          if user_persona.agree_with_claimant_pension_benefits == 'No'
            no.set(true)
            disagree_claimant_pension_benefits_reason.set(user_persona.disagree_claimant_pension_benefits_reason)
          else
            yes.set(true)
          end
        end

      end
    end
  end
end
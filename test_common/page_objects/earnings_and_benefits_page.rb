module ET3
  module Test
    class EarningsAndBenefitsPage < BasePage
      set_url '/respond/earnings_and_benefits'
      element :header, :content_header, 'earnings_and_benefits.header'
      element :error_header, :error_titled, 'errors.header', exact: true

      section :agree_with_claimants_hours_question, :single_choice_option, 'questions.agree_with_claimants_hours.label', exact: false do
        include ET3::Test::I18n

        element :yes, :gds_multiple_choice_option, 'questions.agree_with_claimants_hours.yes.label'
        element :no, :gds_multiple_choice_option, 'questions.agree_with_claimants_hours.no.label'

        section :queried_hours, :question_labelled, 'questions.agree_with_claimants_hours.queried_hours.label', exact: false do
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

        def assert_answers_for(user_persona)
          find(:gds_multiple_choice_option,
               user_persona.agree_with_claimants_hours).assert_selector(:field, nil, checked: true) &&

          if t(user_persona.agree_with_claimants_hours) == t('questions.agree_with_claimants_hours.no.label')
            root_element.
                assert_selector(
                    :field,
                    t('questions.agree_with_claimants_hours.queried_hours.label'),
                    with: user_persona.queried_hours.to_s,
                    exact: false
                )
          end
        end
      end

      section :agree_with_earnings_details_question, :single_choice_option, 'questions.agree_with_earnings_details.label', exact: false do
        include ET3::Test::I18n

        element :yes, :gds_multiple_choice_option, 'questions.agree_with_earnings_details.yes.label'
        element :no, :gds_multiple_choice_option, 'questions.agree_with_earnings_details.no.label'

        section :queried_pay_before_tax, :embedded_single_choice_option, 'questions.agree_with_earnings_details.queried_pay_before_tax_period.label', exact: true do
          section :field, :inputtext_labelled, 'questions.agree_with_earnings_details.queried_pay_before_tax.label', exact: false do
            def set(*args); root_element.set(*args); end
          end

          element :monthly, :gds_multiple_choice_option, 'questions.agree_with_earnings_details.queried_pay_before_tax_period.monthly.label', exact: true
          element :weekly, :gds_multiple_choice_option, 'questions.agree_with_earnings_details.queried_pay_before_tax_period.weekly.label', exact: true

          element :error_not_a_number, :exact_error_text, 'errors.custom.queried_pay_before_tax.not_a_number', exact: false

          delegate :set, to: :field
        end

        section :queried_take_home_pay, :embedded_single_choice_option, 'questions.agree_with_earnings_details.queried_take_home_pay_period.label', exact: false do
          section :field, :inputtext_labelled, 'questions.agree_with_earnings_details.queried_take_home_pay.label', exact: false do
            def set(*args); root_element.set(*args); end
          end
          element :monthly, :gds_multiple_choice_option, 'questions.agree_with_earnings_details.queried_take_home_pay_period.monthly.label', exact: true
          element :weekly, :gds_multiple_choice_option, 'questions.agree_with_earnings_details.queried_take_home_pay_period.weekly.label', exact: true

          element :error_not_a_number, :exact_error_text, 'errors.custom.queried_take_home_pay.not_a_number', exact: false

          delegate :set, to: :field
        end
        
        def set_for(user_persona)
          choose(factory_translate(user_persona.agree_with_earnings_details), name: 'earnings_and_benefits[agree_with_earnings_details]')
          if t(user_persona.agree_with_earnings_details) == t('questions.agree_with_earnings_details.no.label')
            queried_pay_before_tax.set(user_persona.queried_pay_before_tax)
            queried_pay_before_tax.choose(factory_translate(user_persona.queried_pay_before_tax_period))
            queried_take_home_pay.set(user_persona.queried_take_home_pay)
            queried_take_home_pay.choose(factory_translate(user_persona.queried_take_home_pay_period))
          end
        end

        def assert_answers_for(user_persona)
          find(:gds_multiple_choice_option,
               user_persona.agree_with_earnings_details).assert_selector(:field, nil, checked: true) &&

          if t(user_persona.agree_with_claimants_description_of_job_or_title) == t('questions.agree_with_claimants_description_of_job_or_title.no.label')
            root_element.
                assert_selector(
                    :field,
                    t('questions.agree_with_earnings_details.queried_pay_before_tax.label'),
                    with: sprintf( '%.2f', user_persona.queried_pay_before_tax),
                    exact: false
                ) &&
            find(:gds_multiple_choice_option,
                   user_persona.queried_pay_before_tax_period).assert_selector(:field, nil, checked: true) &&
            root_element.
                assert_selector(
                    :field,
                    t('questions.agree_with_earnings_details.queried_take_home_pay.label'),
                    with: sprintf('%.2f', user_persona.queried_take_home_pay),
                    exact: false
                ) &&
            find(:gds_multiple_choice_option,
                 user_persona.queried_take_home_pay_period).assert_selector(:field, nil, checked: true)
          end
        end
      end

      section :agree_with_claimant_notice_question, :single_choice_option, 'questions.agree_with_claimant_notice.label', exact: false do
        include ET3::Test::I18n
        element :yes, :gds_multiple_choice_option, 'questions.agree_with_claimant_notice.yes.label'
        element :no, :gds_multiple_choice_option, 'questions.agree_with_claimant_notice.no.label'

        section :disagree_claimant_notice_reason, :textarea_labelled, 'questions.agree_with_claimant_notice.disagree_claimant_notice_reason.label', exact: false do
          def set(*args); root_element.set(*args); end
        end

        element :error_too_long, :exact_error_text, 'errors.messages.too_long', exact: false

        def set_for(user_persona)
          choose(factory_translate(user_persona.agree_with_claimant_notice), name: 'earnings_and_benefits[agree_with_claimant_notice]')
          if t(user_persona.agree_with_claimant_notice) == t('questions.agree_with_claimant_notice.no.label')
            disagree_claimant_notice_reason.set(user_persona.disagree_claimant_notice_reason)
          end
        end

        def assert_answers_for(user_persona)
          find(:gds_multiple_choice_option,
               user_persona.agree_with_claimant_notice).assert_selector(:field, nil, checked: true) &&

          if t(user_persona.agree_with_claimant_notice) == t('questions.agree_with_claimant_notice.no.label')
            root_element.
                assert_selector(
                    :field,
                    t('questions.agree_with_claimant_notice.disagree_claimant_notice_reason.label'),
                    with: user_persona.disagree_claimant_notice_reason,
                    exact: false
                )
          end
        end
      end

      section :agree_with_claimant_pension_benefits_question, :single_choice_option, 'questions.agree_with_claimant_pension_benefits.label', exact: false do
        include ET3::Test::I18n
        element :yes, :gds_multiple_choice_option, 'questions.agree_with_claimant_pension_benefits.yes.label'
        element :no, :gds_multiple_choice_option, 'questions.agree_with_claimant_pension_benefits.no.label'

        section :disagree_claimant_pension_benefits_reason, :textarea_labelled, 'questions.agree_with_claimant_pension_benefits.disagree_claimant_pension_benefits_reason.label', exact: false do
          def set(*args); root_element.set(*args); end
        end

        element :error_too_long, :exact_error_text, 'errors.messages.too_long', exact: false

        def set_for(user_persona)
          choose(factory_translate(user_persona.agree_with_claimant_pension_benefits), name: 'earnings_and_benefits[agree_with_claimant_pension_benefits]')
          if t(user_persona.agree_with_claimant_pension_benefits) == t('questions.agree_with_claimant_pension_benefits.no.label')
            disagree_claimant_pension_benefits_reason.set(user_persona.disagree_claimant_pension_benefits_reason)
          end
        end

        def assert_answers_for(user_persona)
          find(:gds_multiple_choice_option,
               user_persona.agree_with_claimant_pension_benefits).assert_selector(:field, nil, checked: true) &&

          if t(user_persona.agree_with_claimant_pension_benefits) == t('questions.agree_with_claimant_pension_benefits.no.label')
            root_element.
                assert_selector(
                    :field,
                    t('questions.agree_with_claimant_pension_benefits.disagree_claimant_pension_benefits_reason.label'),
                    with: user_persona.disagree_claimant_pension_benefits_reason,
                    exact: false
                )
          end
        end
      end
      element :continue_button, :submit_text, 'components.save_and_continue_button'
      def next
        continue_button.click
      end
    end
  end
end
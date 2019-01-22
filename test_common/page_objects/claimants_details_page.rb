module ET3
  module Test
    class ClaimantsDetailsPage < BasePage
      set_url '/respond/claimants_details'

      element :header, :content_header, 'claimants_details.header'

      element :error_header, :error_titled, 'errors.header', exact: true

      section :claimants_name_question, :question_labelled, 'questions.claimants_name.label', exact: false do
        element :field, :css, "input"
        element :error_contains_numbers, :exact_error_text, 'errors.custom.claimants_name.not_a_number', exact: false
        element :error_invalid_name, :exact_error_text, 'errors.messages.invalid_name', exact: false
         def set(*args); field.set(*args); end
      end

      section :agree_with_early_conciliation_details_question, :single_choice_option, 'questions.agree_with_early_conciliation_details.label', exact: false do
        include ET3::Test::I18n
        element :yes, :gds_multiple_choice_option, 'questions.agree_with_early_conciliation_details.yes.label'
        element :no, :gds_multiple_choice_option, 'questions.agree_with_early_conciliation_details.no.label'

        element :disagree_conciliation_reason, :textarea_labelled, 'questions.agree_with_early_conciliation_details.disagree_conciliation_reason.label', exact: false

        def set_for(user_persona)
          choose(factory_translate(user_persona.agree_with_early_conciliation_details), name: 'claimants_detail[agree_with_early_conciliation_details]')
          if t(user_persona.agree_with_early_conciliation_details) == t('questions.agree_with_early_conciliation_details.no.label')
            disagree_conciliation_reason.set(user_persona.disagree_conciliation_reason)
          end
        end

        def assert_answers_for(user_persona)
          find(:gds_multiple_choice_option,
               user_persona.agree_with_early_conciliation_details).assert_selector(:field, nil, checked: true) &&

          if t(user_persona.agree_with_early_conciliation_details) == t('questions.agree_with_early_conciliation_details.no.label')
            root_element.
                assert_selector(
                    :field,
                    t('questions.agree_with_early_conciliation_details.disagree_conciliation_reason.label'),
                    with: user_persona.disagree_conciliation_reason
                )
          end
        end
      end

      section :agree_with_employment_dates_question, :single_choice_option, 'questions.agree_with_employment_dates.label', exact: false do
        include ET3::Test::I18n
        element :yes, :gds_multiple_choice_option, 'questions.agree_with_employment_dates.yes.label'
        element :no, :gds_multiple_choice_option, 'questions.agree_with_employment_dates.no.label'

        section :employment_start, :single_choice_option, 'questions.agree_with_employment_dates.employment_start.label', exact: false do
          section :day, :question_labelled, 'questions.agree_with_employment_dates.employment_start.day.label', exact: true do
            element :field, :css, 'input'
              def set(*args); field.set(*args); end
          end
          section :month, :question_labelled, 'questions.agree_with_employment_dates.employment_start.month.label', exact: true do
            element :field, :css, 'input'
              def set(*args); field.set(*args); end
          end
          section :year, :question_labelled, 'questions.agree_with_employment_dates.employment_start.year.label', exact: true do
            element :field, :css, 'input'
              def set(*args); field.set(*args); end
          end
          element :error_inclusion, :exact_error_text, 'errors.custom.agree_with_employment_dates.inclusion', exact: false
          element :error_blank, :exact_error_text, 'errors.messages.blank', exact: false

          def set(value)
            (day_value, month_value, year_value) = value.split("/")
            day.set(day_value)
            month.set(month_value)
            year.set(year_value)
          end

          def assert_date(user_start_date)
            user_start_day, user_start_month, user_start_year = user_start_date.split('/')
            day.assert_selector("input[value='#{user_start_day.to_i}']") &&
            month.assert_selector("input[value='#{user_start_month.to_i}']") &&
            year.assert_selector("input[value='#{user_start_year.to_i}']")
          end
        end

        section :employment_end, :single_choice_option, 'questions.agree_with_employment_dates.employment_end.label', exact: false do
          section :day, :question_labelled, 'questions.agree_with_employment_dates.employment_end.day.label', exact: true do
            element :field, :css, 'input'
              def set(*args); field.set(*args); end
          end

          section :month, :question_labelled, 'questions.agree_with_employment_dates.employment_end.month.label', exact: true do
            element :field, :css, 'input'
              def set(*args); field.set(*args); end
          end

          section :year, :question_labelled, 'questions.agree_with_employment_dates.employment_end.year.label', exact: true do
            element :field, :css, 'input'
              def set(*args); field.set(*args); end
          end
          element :error_blank, :exact_error_text, 'errors.messages.blank', exact: false
          def set(value)
            (day_value, month_value, year_value) = value.split("/")
            day.set(day_value)
            month.set(month_value)
            year.set(year_value)
          end

          def assert_date(user_end_date)
            user_end_day, user_end_month, user_end_year = user_end_date.split('/')
            day.has_css?("input[value='#{user_end_day.to_i}']") &&
            month.has_css?("input[value='#{user_end_month.to_i}']") &&
            year.has_css?("input[value='#{user_end_year.to_i}']")
          end
        end

        section :disagree_employment, :question_labelled, 'questions.agree_with_employment_dates.disagree_employment.label', exact: false do
          element :field, :css, 'textarea'
          element :error_blank, :exact_error_text, 'errors.messages.blank', exact: false
            def set(*args); field.set(*args); end
        end

        element :error_blank, :exact_error_text, 'errors.messages.blank', exact: false
        def set_for(user_persona)
          choose(factory_translate(user_persona.agree_with_employment_dates), name: 'claimants_detail[agree_with_employment_dates]')
          if (t(user_persona.agree_with_employment_dates) == t('questions.agree_with_employment_dates.no.label'))

            day, month, year = user_persona.employment_start.split('/')
            employment_start.day.set(day)
            employment_start.month.set(month)
            employment_start.year.set(year)

            day, month, year = user_persona.employment_end.split('/')
            employment_end.day.set(day)
            employment_end.month.set(month)
            employment_end.year.set(year)

            disagree_employment.set(user_persona.disagree_employment)
          end
        end

        def assert_answers_for(user_persona)
          find(:gds_multiple_choice_option,
               user_persona.agree_with_employment_dates).assert_selector(:field, nil, checked: true) &&

          if t(user_persona.agree_with_employment_dates) == t('questions.agree_with_employment_dates.no.label')
            employment_start.assert_date(user_persona.employment_start) &&
            employment_end.assert_date(user_persona.employment_end) &&
            root_element.
                assert_selector(
                    :field,
                    t('questions.agree_with_employment_dates.disagree_employment.label'),
                    with: user_persona.disagree_employment
                )
          end
        end
      end

      section :continued_employment_question, :single_choice_option, 'questions.continued_employment.label', exact: false do
        include ET3::Test::I18n
        element :yes, :gds_multiple_choice_option, 'questions.continued_employment.yes.label'
        element :no, :gds_multiple_choice_option, 'questions.continued_employment.no.label'

          def set_for(value)
          choose(factory_translate(value), name: 'claimants_detail[continued_employment]')
        end
        def assert_answer(untranslated_symbol)
          find(:gds_multiple_choice_option, untranslated_symbol).assert_selector(:field, nil, checked: true)
        end
      end

      section :agree_with_claimants_description_of_job_or_title_question, :single_choice_option, 'questions.agree_with_claimants_description_of_job_or_title.label', exact: false do
        include ET3::Test::I18n
        element :yes, :gds_multiple_choice_option, 'questions.agree_with_claimants_description_of_job_or_title.yes.label'
        element :no, :gds_multiple_choice_option, 'questions.agree_with_claimants_description_of_job_or_title.no.label'

        section :disagree_claimants_job_or_title, :textarea_labelled, 'questions.agree_with_claimants_description_of_job_or_title.disagree_claimants_job_or_title.label', exact: false do
          def set(*args); root_element.set(*args); end
        end

        def set_for(user_persona)
          choose(factory_translate(user_persona.agree_with_claimants_description_of_job_or_title), name: 'claimants_detail[agree_with_claimants_description_of_job_or_title]')
          if (t(user_persona.agree_with_claimants_description_of_job_or_title) == t('questions.agree_with_claimants_description_of_job_or_title.no.label'))
            disagree_claimants_job_or_title.set(user_persona.disagree_claimants_job_or_title)
          end
        end

        def assert_answers_for(user_persona)
          find(:gds_multiple_choice_option,
               user_persona.agree_with_claimants_description_of_job_or_title).assert_selector(:field, nil, checked: true) &&

          if t(user_persona.agree_with_claimants_description_of_job_or_title) == t('questions.agree_with_claimants_description_of_job_or_title.no.label')
            root_element.
                assert_selector(
                    :field,
                    t('questions.agree_with_claimants_description_of_job_or_title.disagree_claimants_job_or_title.label'),
                    with: user_persona.disagree_claimants_job_or_title
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
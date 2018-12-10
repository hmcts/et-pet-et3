module ET3
  module Test
    class ClaimantsDetailsPage < BasePage
      set_url '/respond/claimants_details'

      element :error_header, :error_titled, 'errors.header', exact: true
      # TODO - Claimant's Details
      # Claimant's name (optional)
      section :claimants_name_question, :question_labelled, 'questions.claimants_name.label', exact: false do
        element :field, :css, "input"
        element :error_contains_numbers, :exact_error_text, 'errors.messages.contains_numbers', exact: false
        element :error_invalid_name, :exact_error_text, 'errors.messages.invalid_name', exact: false
         def set(*args); field.set(*args); end
      end

      # Do you agree with the details given by the claimant about Early Conciliation with Acas? (optional)
      section :agree_with_early_conciliation_details_question, :single_choice_option, 'questions.agree_with_early_conciliation_details.label', exact: false do
        include ET3::Test::I18n
        element :yes, :gds_multiple_choice_option, 'questions.agree_with_early_conciliation_details.yes.label' do
          element :selector, :css, 'input[type="radio"]'
          def set(*args); selector.set(*args); end
        end
        element :no, :gds_multiple_choice_option, 'questions.agree_with_early_conciliation_details.no.label' do
          element :selector, :css, 'input[type="radio"]'
          def set(*args); selector.set(*args); end
        end
        def set_for(value)
          choose(factory_translate(value), name: 'claimants_detail[agree_with_early_conciliation_details]')
        end
      end

      # Why do you disagree with the claimant? (optional)
      section :disagree_conciliation_reason, :textarea_labelled, 'questions.agree_with_early_conciliation_details.disagree_conciliation_reason.label', exact: false do
        def set(*args); root_element.set(*args); end
      end

      # Are the dates of employment given by the claimant correct?
      section :agree_with_employment_dates_question, :single_choice_option, 'questions.agree_with_employment_dates.label', exact: false do
        include ET3::Test::I18n
        element :yes, :gds_multiple_choice_option, 'questions.agree_with_employment_dates.yes.label' do
          element :selector, :css, 'input[type="radio"]'
          def set(*args); selector.set(*args); end
        end
        element :no, :gds_multiple_choice_option, 'questions.agree_with_employment_dates.no.label' do
          element :selector, :css, 'input[type="radio"]'
          def set(*args); selector.set(*args); end
        end

        # When their employment started
        section :employment_start, :single_choice_option, 'questions.agree_with_employment_dates.employment_start.label', exact: false do
          # For example, 31 03 2010
          element :employment_example_startdate, :form_hint, 'hint.claimants_detail.employment_start'
          # Day
          section :day, :question_labelled, 'questions.agree_with_employment_dates.employment_start.day.label', exact: true do
            element :field, :css, 'input'
              def set(*args); field.set(*args); end
          end
          # Month
          section :month, :question_labelled, 'questions.agree_with_employment_dates.employment_start.month.label', exact: true do
            element :field, :css, 'input'
              def set(*args); field.set(*args); end
          end
          # Year
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

          def assert_date_for(user_persona)
            user_start_day, user_start_month, user_start_year = user_persona.employment_start.split('/')
            day.has_css?("input[value='#{user_start_day.to_i}']") &&
            month.has_css?("input[value='#{user_start_month.to_i}']") &&
            year.has_css?("input[value='#{user_start_year.to_i}']")
          end
        end

        # When their employment ended or will end
        section :employment_end, :single_choice_option, 'questions.agree_with_employment_dates.employment_end.label', exact: false do
          # For example, 01 12 2017
          element :employment_example_enddate, :form_hint, 'hint.claimants_detail.employment_end'
          # Day
          section :day, :question_labelled, 'questions.agree_with_employment_dates.employment_end.day.label', exact: true do
            element :field, :css, 'input'
              def set(*args); field.set(*args); end
          end
          # Month
          section :month, :question_labelled, 'questions.agree_with_employment_dates.employment_end.month.label', exact: true do
            element :field, :css, 'input'
              def set(*args); field.set(*args); end
          end
          # Year
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

          def assert_date_for(user_persona)
            user_end_day, user_end_month, user_end_year = user_persona.employment_end.split('/')
            day.has_css?("input[value='#{user_end_day.to_i}']") &&
            month.has_css?("input[value='#{user_end_month.to_i}']") &&
            year.has_css?("input[value='#{user_end_year.to_i}']")
          end
        end
        # Why do you disagree with the dates given by the claimant
        section :disagree_employment, :question_labelled, 'questions.agree_with_employment_dates.disagree_employment.label', exact: false do
          element :field, :css, 'textarea'
          element :error_blank, :exact_error_text, 'errors.messages.blank', exact: false
            def set(*args); field.set(*args); end
        end
        element :error_blank, :exact_error_text, 'errors.messages.blank', exact: false
        def set_for(user_persona)
          choose(factory_translate(user_persona.agree_with_employment_dates), name: 'claimants_detail[agree_with_employment_dates]')
          if (t(user_persona.agree_with_employment_dates) == 'No')
            # Employment started
            day, month, year = user_persona.employment_start.split('/')
            employment_start.day.set(day)
            employment_start.month.set(month)
            employment_start.year.set(year)
            # Employment ended
            day, month, year = user_persona.employment_end.split('/')
            employment_end.day.set(day)
            employment_end.month.set(month)
            employment_end.year.set(year)
            disagree_employment.set(user_persona.disagree_employment)
          end
        end
      end

      # Is their employment continuing? (optional)
      section :continued_employment_question, :single_choice_option, 'questions.continued_employment.label', exact: false do
        include ET3::Test::I18n
        element :yes, :gds_multiple_choice_option, 'questions.continued_employment.yes.label' do
          element :selector, :css, 'input[type="radio"]'
          def set(*args); selector.set(*args); end
        end
        element :no, :gds_multiple_choice_option, 'questions.continued_employment.no.label' do
          element :selector, :css, 'input[type="radio"]'
          def set(*args); selector.set(*args); end
        end
        def set_for(value)
          choose(factory_translate(value), name: 'claimants_detail[continued_employment]')
        end
      end
      # Is the claimant's description of their job or job title correct? (optional)
      section :agree_with_claimants_description_of_job_or_title_question, :single_choice_option, 'questions.agree_with_claimants_description_of_job_or_title.label', exact: false do
        include ET3::Test::I18n
        element :yes, :gds_multiple_choice_option, 'questions.agree_with_claimants_description_of_job_or_title.yes.label' do
          element :selector, :css, 'input[type="radio"]'
          def set(*args); selector.set(*args); end
        end
        element :no, :gds_multiple_choice_option, 'questions.agree_with_claimants_description_of_job_or_title.no.label' do
          element :selector, :css, 'input[type="radio"]'
          def set(*args); selector.set(*args); end
        end
        section :disagree_claimants_job_or_title, :textarea_labelled, 'questions.agree_with_claimants_description_of_job_or_title.disagree_claimants_job_or_title.label', exact: false do
          def set(*args); root_element.set(*args); end
        end
        def set_for(user_persona)
          choose(factory_translate(user_persona.agree_with_claimants_description_of_job_or_title), name: 'claimants_detail[agree_with_claimants_description_of_job_or_title]')
          if (t(user_persona.agree_with_claimants_description_of_job_or_title) == t('questions.agree_with_claimants_description_of_job_or_title.no.label'))
            disagree_claimants_job_or_title.set(user_persona.disagree_claimants_job_or_title)
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
module ET3
  module Test
    class ClaimantsDetailsPage < BasePage
      set_url '/respond/claimants_details'

      element :error_header, :error_titled, 'errors.header', exact: true
      # Claimant's Details
      # Claimant's name (optional)
      section :claimants_name_question, :question_labelled, 'questions.claimants_name.label', exact: false do
        element :field, :css, "input"
        element :error_contains_numbers, :exact_error_text, 'errors.messages.contains_numbers', exact: false
        element :error_invalid_name, :exact_error_text, 'errors.messages.invalid_name', exact: false
         def set(*args); field.set(*args); end
      end

      # Do you agree with the details given by the claimant about Early Conciliation with Acas? (optional)
      section :agree_with_early_conciliation_details_question, :single_choice_option, 'questions.agree_with_early_conciliation_details.label', exact: false do
        include SingleChoiceOptionSection
        section :disagree_conciliation_reason, :textarea_labelled, 'questions.agree_with_early_conciliation_details.disagree_conciliation_reason.label', exact: false do
          delegate :set, to: :root_element
        end

        def set_for(user_persona)
          choose(user_persona.agree_with_early_conciliation_details)
          disagree_conciliation_reason.set(user_persona.disagree_conciliation_reason) if no.has_checked_field?
        end
      end

      section :agree_with_employment_dates_question, :single_choice_option, 'questions.agree_with_employment_dates.label', exact: false do
        include SingleChoiceOptionSection
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
          def assert_date_for(user_persona)
            user_start_day, user_start_month, user_start_year = user_persona.employment_start.split('/')
            day.has_css?("input[value='#{user_start_day.to_i}']") &&
            month.has_css?("input[value='#{user_start_month.to_i}']") &&
            year.has_css?("input[value='#{user_start_year.to_i}']")
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
          def assert_date_for(user_persona)
            user_end_day, user_end_month, user_end_year = user_persona.employment_end.split('/')
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
          choose(user_persona.agree_with_employment_dates)
          if no.has_checked_field?
            if user_persona.employment_start != nil
              day, month, year = user_persona.employment_start.split('/')
              employment_start.day.set(day)
              employment_start.month.set(month)
              employment_start.year.set(year)
            end
            if user_persona.employment_end != nil
              day, month, year = user_persona.employment_end.split('/')
              employment_end.day.set(day)
              employment_end.month.set(month)
              employment_end.year.set(year)
            end
            disagree_employment.set(user_persona.disagree_employment) unless user_persona.disagree_employment == nil
          end
        end
      end

      section :continued_employment_question, :single_choice_option, 'questions.continued_employment.label', exact: false do
        include SingleChoiceOptionSection
        def set_for(user_persona)
          choose(user_persona.continued_employment)
        end
      end

      section :agree_with_claimants_description_of_job_or_title_question, :single_choice_option, 'questions.agree_with_claimants_description_of_job_or_title.label', exact: false do
        include SingleChoiceOptionSection
        section :disagree_claimants_job_or_title, :textarea_labelled, 'questions.agree_with_claimants_description_of_job_or_title.disagree_claimants_job_or_title.label', exact: false do
          delegate :set, to: :root_element
        end

        def set_for(user_persona)
          choose(user_persona.agree_with_claimants_description_of_job_or_title)
          disagree_claimants_job_or_title.set(user_persona.disagree_claimants_job_or_title) if no.has_checked_field?
        end

      end

      element :continue_button, :button, "Save and continue"
      def next
        continue_button.click
      end
    end
  end
end
module ET3
  module Test
    class ClaimantsDetailsPage < BasePage
      set_url '/respond/claimants_details'

      element :error_header, :error_titled, 'errors.header', exact: true

      section :claimants_name_question, :question_labelled, 'questions.claimants_name.label', exact: false do
        element :field, :css, "input"
        element :error_contains_numbers, :exact_error_text, 'errors.messages.contains_numbers', exact: false
        element :error_contains_no_spaces, :exact_error_text, 'errors.messages.contains_no_spaces', exact: false


        delegate :set, to: :field
      end

      section :agree_with_early_conciliation_details_question, :single_choice_option, 'questions.agree_with_early_conciliation_details.label', exact: false do
        
        section :yes, :gds_multiple_choice_option, 'questions.agree_with_early_conciliation_details.yes.label', exact: false do
          element :selector, :css, 'input[type="radio"]'

          delegate :set, to: :selector
        end
        
        section :no, :gds_multiple_choice_option, 'questions.agree_with_early_conciliation_details.no.label', exact: false do
          element :selector, :css, 'input[type="radio"]'
          
          delegate :set, to: :selector          
        end

        section :disagree_conciliation_reason, :textarea_labelled, 'questions.agree_with_early_conciliation_details.disagree_conciliation_reason.label', exact: false do
          delegate :set, to: :root_element
        end

        def set_for(user_persona)
          if user_persona.agree_with_early_conciliation_details == 'No'
            no.set(true)
            disagree_conciliation_reason.set(user_persona.disagree_conciliation_reason)
          else
            yes.set(true)
          end
        end
      end

      section :agree_with_employment_dates_question, :single_choice_option, 'questions.agree_with_employment_dates.label', exact: false do
        
        section :yes, :gds_multiple_choice_option, 'questions.agree_with_employment_dates.yes.label', exact: false do
          element :selector, :css, 'input[type="radio"]'

          delegate :set, to: :selector
        end

        section :no, :gds_multiple_choice_option, 'questions.agree_with_employment_dates.no.label', exact: false do
          element :selector, :css, 'input[type="radio"]'

          delegate :set, to: :selector
        end

        section :employment_start, :single_choice_option, 'questions.agree_with_employment_dates.employment_start.label', exact: false do

          section :day, :question_labelled, 'questions.agree_with_employment_dates.employment_start.day.label', exact: true do
            element :field, :css, 'input'

            delegate :set, to: :field
          end

          section :month, :question_labelled, 'questions.agree_with_employment_dates.employment_start.month.label', exact: true do
            element :field, :css, 'input'

            delegate :set, to: :field
          end

          section :year, :question_labelled, 'questions.agree_with_employment_dates.employment_start.year.label', exact: true do
            element :field, :css, 'input'

            delegate :set, to: :field
          end

          element :error_blank, :exact_error_text, 'errors.messages.blank', exact: false

          def assert_date_for(user_persona)
            byebug
            user_start_day, user_start_month, user_start_year = user_persona.employment_start.split('/')
            day.field.value.to_i == user_start_day.to_i && month.field.value.to_i == user_start_month.to_i && year.field.value.to_i == user_start_year.to_i
          end

        end

        section :employment_end, :single_choice_option, 'questions.agree_with_employment_dates.employment_end.label', exact: false do

          section :day, :question_labelled, 'questions.agree_with_employment_dates.employment_end.day.label', exact: true do
            element :field, :css, 'input'

            delegate :set, to: :field
          end

          section :month, :question_labelled, 'questions.agree_with_employment_dates.employment_end.month.label', exact: true do
            element :field, :css, 'input'

            delegate :set, to: :field
          end

          section :year, :question_labelled, 'questions.agree_with_employment_dates.employment_end.year.label', exact: true do
            element :field, :css, 'input'

            delegate :set, to: :field
          end

          element :error_blank, :exact_error_text, 'errors.messages.blank', exact: false

          def assert_date_for(user_persona)
            user_end_day, user_end_month, user_end_year = user_persona.employment_end.split('/')
            day.field.value.to_i == user_end_day.to_i && month.field.value.to_i == user_end_month.to_i && year.field.value.to_i == user_end_year.to_i
          end

        end

        section :disagree_employment, :question_labelled, 'questions.agree_with_employment_dates.disagree_employment.label', exact: false do
          element :field, :css, 'textarea'
          element :error_blank, :exact_error_text, 'errors.messages.blank', exact: false
          
          delegate :set, to: :field
        end

        element :error_blank, :exact_error_text, 'errors.messages.blank', exact: false

        def set_for(user_persona)
          if user_persona.agree_with_employment_dates == 'No'
            no.set(true)
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
          else
            yes.set(true)
          end
        end
      end

      section :continued_employment_question, :single_choice_option, 'questions.continued_employment.label', exact: false do
        section :yes, :gds_multiple_choice_option, 'questions.continued_employment.yes.label' do
          element :selector, :css, "input"

          delegate :set, to: :selector
        end

        section :no, :gds_multiple_choice_option, 'questions.continued_employment.no.label' do
          element :selector, :css, "input"

          delegate :set, to: :selector
        end

        def set_for(user_persona)
          yes.set(true) if user_persona.continued_employment == 'Yes'
          no.set(true) if user_persona.continued_employment == 'No'
        end
      end

      section :agree_with_claimants_description_of_job_or_title_question, :single_choice_option, 'questions.agree_with_claimants_description_of_job_or_title.label', exact: false do
        
        section :yes, :gds_multiple_choice_option, 'questions.agree_with_claimants_description_of_job_or_title.yes.label' do
          element :selector, :css, "input"

          delegate :set, to: :selector
        end

        section :no, :gds_multiple_choice_option, 'questions.agree_with_claimants_description_of_job_or_title.no.label' do
          element :selector, :css, "input"

          delegate :set, to: :selector
        end

        section :disagree_claimants_job_or_title, :textarea_labelled, 'questions.agree_with_claimants_description_of_job_or_title.disagree_claimants_job_or_title.label', exact: false do
          delegate :set, to: :root_element
        end

        def set_for(user_persona)
          if user_persona.agree_with_claimants_description_of_job_or_title == 'No'
            no.set(true)
            disagree_claimants_job_or_title.set(user_persona.disagree_claimants_job_or_title)
          else 
            yes.set(true)
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
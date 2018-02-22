module ET3
  module Test
    class ClaimantsDetailsPage < BasePage
      set_url '/respond/claimants_details'

      section :claimants_name_question, :question_labelled, 'questions.claimants_name.label', exact: true do
        element :field, :css, "input"

        delegate :set, to: :field
      end

      section :agree_with_early_conciliation_details_question, :single_choice_option, 'questions.agree_with_early_conciliation_details.label', exact: true do
        
        section :yes, :gds_multiple_choice_option, 'questions.agree_with_early_conciliation_details.yes.label', exact: true do
          element :selector, :css, 'input[type="radio"]'

          delegate :set, to: :selector
        end
        
        section :no, :gds_multiple_choice_option, 'questions.agree_with_early_conciliation_details.no.label', exact: true do
          element :selector, :css, 'input[type="radio"]'
          
          delegate :set, to: :selector          
        end

        section :disagree_conciliation_reason, :textarea_labelled, 'questions.agree_with_early_conciliation_details.disagree_conciliation_reason.label', exact: true do
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

      section :agree_with_employment_dates_question, :single_choice_option, 'questions.agree_with_employment_dates.label', exact: true do
        
        section :yes, :gds_multiple_choice_option, 'questions.agree_with_employment_dates.yes.label', exact: true do
          element :selector, :css, 'input[type="radio"]'

          delegate :set, to: :selector
        end

        section :no, :gds_multiple_choice_option, 'questions.agree_with_employment_dates.no.label', exact: true do
          element :selector, :css, 'input[type="radio"]'

          delegate :set, to: :selector
        end

        section :employment_start, :question_labelled, 'questions.agree_with_employment_dates.employment_start.label', exact: true do
          element :field, :css, 'input[type="date"]'

          delegate :set, to: :field
        end

        section :employment_end, :question_labelled, 'questions.agree_with_employment_dates.employment_end.label', exact: true do
          element :field, :css, 'input[type="date"]'

          delegate :set, to: :field
        end

        section :disagree_employment, :textarea_labelled, 'questions.agree_with_employment_dates.disagree_employment.label', exact: true do
          delegate :set, to: :root_element
        end

        def set_for(user_persona)
          if user_persona.agree_with_employment_dates == 'No'
            no.set(true)
            employment_start.set(user_persona.agree_with_employment_start)
            employment_end.set(user_persona.agree_with_employment_end)
            disagree_employment.set(user_persona.disagree_employment)
          else
            yes.set(true)
          end
        end
      end

      section :continued_employment_question, :single_choice_option, 'questions.continued_employment.label', exact: true do
        element :field, :css, "input"

        delegate :set, to: :field
      end

      section :agree_with_claimants_description_of_job_or_title_question, :single_choice_option, 'questions.agree_with_claimants_description_of_job_or_title.label', exact: true do
        
        section :yes, :gds_multiple_choice_option, 'questions.agree_with_claimants_description_of_job_or_title.yes.label' do
          element :selector, :css, "input"

          delegate :set, to: :selector
        end

        section :no, :gds_multiple_choice_option, 'questions.agree_with_claimants_description_of_job_or_title.no.label' do
          element :selector, :css, "input"

          delegate :set, to: :selector
        end

        section :disagree_claimants_job_or_title, :textarea_labelled, 'questions.agree_with_claimants_description_of_job_or_title.disagree_claimants_job_or_title.label', exact: true do
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
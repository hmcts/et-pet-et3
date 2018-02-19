module ET3
  module Test
    class ClaimantsDetailsPage < BasePage
      set_url '/respond/claimants_details'

      section :claimants_name_question, :question_labelled, 'questions.claimants_name.label', exact: true do
        element :field, :css, "input"

        delegate :set, to: :field
      end

      section :early_conciliation_details_question, :single_choice_option, 'questions.early_conciliation_details.label', exact: true do
        element :selector, :css, "input"

        delegate :set, to: :selector
      end

      section :employment_dates_question, :single_choice_option, 'questions.employment_dates.label', exact: true do
        element :field, :css, "input"

        delegate :set, to: :field
      end
      
      section :continued_employment_question, :single_choice_option, 'questions.continued_employment.label', exact: true do
        element :field, :css, "input"

        delegate :set, to: :field
      end

      section :claimants_description_of_job_or_title_question, :single_choice_option, 'questions.claimants_description_of_job_or_title.label', exact: true do
        element :field, :css, "input"

        delegate :set, to: :field
      end

      element :continue_button, :button, "Save and continue"
      def next
        continue_button.click
      end
    end
  end
end
module ET3
  module Test
    class CaseHeardByPage < BasePage
      include EtTestHelpers::Page
      set_url "/respond/case_heard_by"


      def fill_in_all(respondent:)
        fill_in_case_heard_by(respondent:)
        self
      end
      # Fills in the claimant's personal info
      # @param [Claimant] claimant The claimant
      def fill_in_case_heard_by(respondent:)
        case_heard_by_preference_question.set(respondent.case_heard_by_preference)
        case_heard_by_preference_reason_question.set(respondent.case_heard_by_preference_reason) if respondent.case_heard_by_preference.to_s.split('.').last.in?(%w[judge panel])
      end

      def save_and_complete_later
        save_and_complete_later_button.click
      end

      def next
        continue_button.click
      end

      element :header, :content_header, 'case_heard_by.header'
      element :error_header, :error_titled, 'errors.header', exact: true

      private

      # @!method case_heard_by_preference_question
      #   A govuk radio button component for the case heard by preference question
      #   @return [EtTestHelpers::Components::GovUKCollectionRadioButtons] The site prism section
      gds_radios :case_heard_by_preference_question, :'questions.case_heard_by.case_heard_by_preference'

      # @!method case_heard_by_preference_reason_question
      #   A govuk text area component for the optional case heard by preference reason question
      #   @return [EtTestHelpers::Components::GovUKTextArea] The site prism section
      gds_text_area :case_heard_by_preference_reason_question, :'questions.case_heard_by.case_heard_by_preference_reason'

      # @!method continue_button
      #   A govuk submit button component...
      #   @return [EtTestHelpers::Components::GovUKSubmit] The site prism section
      gds_submit_button :continue_button, :'components.save_and_continue_button'
      element :save_and_complete_later_button, :link_named, "components.save_and_complete_later_button"
    end
  end
end

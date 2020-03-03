module ET3
  module Test
    class FeedbackPage < BasePage
      set_url '/feedback'

      def fill_in_feedback(feedback)
        fill_in 'Have you had any problems using this service?',  with: feedback.problems
        fill_in 'Do you have any other comments or suggestions?', with: feedback.suggestions
        fill_in 'Your email address',                             with: feedback.email_address

      end

      element :submit_button, :submit_text, 'feedback.submit_button'

      def submit
        submit_button.click
      end

    end
  end
end
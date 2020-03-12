module ET3
  module Test
    class FeedbackPage < BasePage
      set_url '/feedback'

      section :feedback_problems_question, :question_labelled, 'questions.feedback.problems', exact: false do
        element :field, :css, "textarea"
        def set(*args); field.set(*args); end
      end

      section :feedback_suggestions_question,  :question_labelled, 'questions.feedback.suggestions', exact: false  do
        element :field,  :css, "textarea"
        def set(*args); field.set(*args); end
      end

      section :feedback_email_address_question,  :question_labelled, 'questions.feedback.email_address', exact: false  do
        element :field,  :css, "input"
        def set(*args); field.set(*args); end
      end

      def fill_in_feedback(feedback)
        feedback_problems_question.set(feedback.problems)
        feedback_suggestions_question.set(feedback.suggestions)
        feedback_email_address_question.set(feedback.email_address)

      end

      element :submit_button, :submit_text, 'feedback.submit_button'

      def submit
        submit_button.click
      end

    end
  end
end
module ET3
  module Test
    class YourRepresentativePage < BasePage
      set_url '/respond/your_representative'
      element :header, :content_header, 'your_representative.header'

      section :have_representative_question, :single_choice_option, 'questions.have_representative.label', exact: true do
        include ET3::Test::I18n
        element :yes, :gds_multiple_choice_option, 'questions.have_representative.yes.label'
        element :no, :gds_multiple_choice_option, 'questions.have_representative.no.label'

        def set_for(user_persona)
          choose(factory_translate(user_persona.have_representative), name: 'your_representative[have_representative]')
        end

        def assert_answer(untranslated_symbol)
          find(:gds_multiple_choice_option, untranslated_symbol)
              .assert_selector(:field, nil, checked: true)
        end
      end

      element :continue_button, :submit_text, 'components.save_and_continue_button'
      def next
        continue_button.click
      end
    end
  end
end
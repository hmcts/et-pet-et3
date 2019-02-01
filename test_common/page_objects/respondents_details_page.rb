module ET3
  module Test
    class RespondentsDetailsPage < BasePage
      set_url '/respond/respondents_details'
      element :header, :content_header, 'respondents_details.header'
      element :error_header, :error_titled, 'errors.header', exact: true
      section :case_number_question, :question_labelled, 'questions.case_number.label', exact: false do
        element :field, :css, "input"
        element :error_invalid, :exact_error_text, 'errors.messages.invalid', exact: false
        def set(*args); field.set(*args); end
      end
      section :name_question, :question_labelled, 'questions.name.label', exact: false do
        element :field, :css, "input"
        element :error_blank, :exact_error_text, 'errors.messages.blank', exact: false
        def set(*args); field.set(*args); end
      end
      section :contact_question, :question_labelled, 'questions.contact.label', exact: false do
        element :field, :css, "input"
        element :error_contains_numbers, :exact_error_text, 'errors.messages.contains_numbers', exact: false
        element :error_contains_invalid_name, :exact_error_text, 'errors.messages.invalid_name', exact: false
        def set(*args); field.set(*args); end
      end
      section :building_name_question, :question_labelled, 'questions.building_name.label', exact: false do
        element :field, :css, "input"
        element :error_blank, :exact_error_text, 'errors.messages.blank', exact: false
        def set(*args); field.set(*args); end
      end
      section :street_question, :question_labelled, 'questions.street.label', exact: false do
        element :field, :css, "input"
        element :error_blank, :exact_error_text, 'errors.messages.blank', exact: false
        def set(*args); field.set(*args); end
      end
      section :town_question, :question_labelled, 'questions.town.label', exact: false do
        element :field, :css, "input"
        element :error_blank, :exact_error_text, 'errors.messages.blank', exact: false
        def set(*args); field.set(*args); end
      end
      section :county_question, :question_labelled, 'questions.county.label', exact: false do
        element :field, :css, "input"
        def set(*args); field.set(*args); end
      end
      section :postcode_question, :question_labelled, 'questions.postcode.label', exact: false do
        element :field, :css, "input"
        element :error_blank, :exact_error_text, 'errors.messages.blank', exact: false
        element :error_invalid_postcode, :exact_error_text, 'errors.messages.invalid_postcode', exact: false
        def set(*args); field.set(*args); end
      end
      section :dx_number_question, :question_labelled, 'questions.dx_number.label', exact: false do
        element :field, :css, "input"
        def set(*args); field.set(*args); end
      end
      section :contact_number_question, :question_labelled, 'questions.contact_number.label', exact: false do
        element :field, :css, "input"
        element :error_invalid_phone_number, :exact_error_text, 'errors.messages.invalid_phone_number', exact: false
        def set(*args); field.set(*args); end
      end
      section :contact_mobile_number_question, :question_labelled, 'questions.contact_mobile_number.label', exact: false do
        element :field, :css, "input"
        element :error_invalid_phone_number, :exact_error_text, 'errors.messages.invalid_phone_number', exact: false
        def set(*args); field.set(*args); end
      end
      section :contact_preference_question, :single_choice_option, 'questions.contact_preference.label', exact: false do
        include ET3::Test::I18n
        element :email, :gds_multiple_choice_option, 'questions.contact_preference.email.label'
        element :post, :gds_multiple_choice_option, 'questions.contact_preference.post.label'
        element :fax, :gds_multiple_choice_option, 'questions.contact_preference.fax.label'

        element :preference_email, :inputtext_labelled, 'questions.contact_preference.email.input_label'
        element :preference_fax, :inputtext_labelled, 'questions.contact_preference.fax.input_label'

        element :error_invalid_email, :exact_error_text, 'errors.messages.invalid_email'
        element :error_invalid_fax, :exact_error_text, 'errors.messages.invalid_phone_number'

        def set_for(user_persona)
          choose(factory_translate(user_persona.contact_preference), name: 'respondents_detail[contact_preference]')
          if t(user_persona.contact_preference) == t('questions.contact_preference.email.label')
            preference_email.set(user_persona.email_address)
          end
          if t(user_persona.contact_preference) == t('questions.contact_preference.fax.label')
            preference_fax.set(user_persona.fax_number)
          end
        end

        def assert_answers_for(user_persona)
          find(:gds_multiple_choice_option, user_persona.contact_preference).assert_selector(:field, nil, checked: true) &&
          case t(user_persona.contact_preference)
          when t('questions.contact_preference.email.label')
            root_element.assert_selector(:field, t('questions.contact_preference.email.input_label'), with: user_persona.email_address)
          when t('questions.contact_preference.fax.label')
            root_element.assert_selector(:field, t('questions.contact_preference.fax.input_label'), with: user_persona.fax_number)
          end
        end
      end

      section :organisation_employ_gb_question, :question_labelled, 'questions.organisation_employ_gb.label', exact: false do
        element :field, :css, "input"
        element :error_blank, :exact_error_text, 'errors.messages.blank', exact: false
        element :error_not_a_number, :exact_error_text, 'errors.custom.organisation_employ_gb.not_a_number', exact: false
        def set(*args); field.set(*args); end
      end

      section :organisation_more_than_one_site_question, :single_choice_option, 'questions.organisation_more_than_one_site.label', exact: false do
        include ET3::Test::I18n
        element :yes, :gds_multiple_choice_option, 'questions.organisation_more_than_one_site.yes.label'
        element :no, :gds_multiple_choice_option, 'questions.organisation_more_than_one_site.no.label'

        element :employment_at_site_number, :inputtext_labelled, 'questions.organisation_more_than_one_site.employment_at_site_number.label', exact: false

        element :error_inclusion, :exact_error_text, 'errors.custom.organisation_more_than_one_site.inclusion', exact: false
        element :error_not_a_number, :exact_error_text, 'errors.custom.organisation_more_than_one_site.not_a_number', exact: false

        def set_for(user_persona)
          choose(factory_translate(user_persona.organisation_more_than_one_site), name: 'respondents_detail[organisation_more_than_one_site]')
          if t(user_persona.organisation_more_than_one_site) == t('questions.organisation_more_than_one_site.yes.label')
            employment_at_site_number.set(user_persona.employment_at_site_number)
          end
        end
        
        def assert_answers_for(user_persona)
          find(:gds_multiple_choice_option,
               user_persona.organisation_more_than_one_site).assert_selector(:field, nil, checked: true) &&
          if t(user_persona.organisation_more_than_one_site) == t('questions.organisation_more_than_one_site.yes.label')
            root_element.
                assert_selector(
                    :field,
                    t('questions.organisation_more_than_one_site.employment_at_site_number.label'),
                    with: user_persona.employment_at_site_number
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
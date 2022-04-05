module ET3
  module Test
    class RespondentsDetailsPage < BasePage
      include EtTestHelpers::Page
      set_url '/respond/respondents_details'
      element :header, :content_header, 'respondents_details.header'
      element :error_header, :error_titled, 'errors.header', exact: true
      gds_text_input :case_number_question, :'questions.respondents_details.case_number.label', exact: false
      gds_text_input :name_question, :'questions.respondents_details.name.label', exact: false
      gds_text_input :contact_question, :'questions.respondents_details.contact.label', exact: false
      gds_text_input :building_name_question, :'questions.respondents_details.building_name.label', exact: false
      gds_text_input :street_question, :'questions.respondents_details.street.label', exact: false
      gds_text_input :town_question, :'questions.respondents_details.town.label', exact: false
      gds_text_input :county_question, :'questions.respondents_details.county.label', exact: false
      gds_text_input :postcode_question, :'questions.respondents_details.postcode.label', exact: false
      gds_text_input :dx_number_question, :'questions.respondents_details.dx_number.label', exact: false
      gds_phone_input :contact_number_question, :'questions.respondents_details.contact_number.label', exact: false
      gds_phone_input :contact_mobile_number_question, :'questions.respondents_details.contact_mobile_number.label', exact: false
      gds_radios :contact_preference_question, :'questions.respondents_details.contact_preference'
      gds_text_input :email_address_question, :'questions.respondents_details.email_address'
      gds_text_input :fax_number_question, :'questions.respondents_details.fax_number'
      gds_text_input :employment_at_site_number_question, :'questions.respondents_details.employment_at_site_number'
      #   def assert_answers_for(user_persona)
      #     find(:gds_multiple_choice_option, user_persona.contact_preference).assert_selector(:field, nil, checked: true) &&
      #     case t(user_persona.contact_preference)
      #     when t('questions.respondents_details.contact_preference.email.label')
      #       root_element.assert_selector(:field, t('questions.respondents_details.contact_preference.email.input_label'), with: user_persona.email_address)
      #     when t('questions.respondents_details.contact_preference.fax.label')
      #       root_element.assert_selector(:field, t('questions.respondents_details.contact_preference.fax.input_label'), with: user_persona.fax_number)
      #     end
      #   end

      gds_text_input :organisation_employ_gb_question, :'questions.respondents_details.organisation_employ_gb.label', exact: false
      gds_radios :video_call_question, :'questions.respondents_details.video_call'
      # section :video_call_question, :single_choice_option, 'questions.respondents_details.video_call.label', exact: false do
      #   include ET3::Test::I18n
      #   element :yes, :gds_multiple_choice_option, 'questions.respondents_details.video_call.yes.label'
      #   element :no, :gds_multiple_choice_option, 'questions.respondents_details.video_call.no.label'
      #
      #   element :error_inclusion, :exact_error_text, 'errors.messages.inclusion', exact: false
      #   def set(value)
      #     return if value.nil?
      #
      #     if value.to_s.split(".")[-2] == 'yes'
      #       yes.click
      #     else
      #       no.click
      #     end
      #   end
      # end

      gds_radios :organisation_more_than_one_site_question, :'questions.respondents_details.organisation_more_than_one_site'
      # section :organisation_more_than_one_site_question, :single_choice_option, 'questions.respondents_details.organisation_more_than_one_site.label', exact: false do
      #   include ET3::Test::I18n
      #   element :yes, :gds_multiple_choice_option, 'questions.respondents_details.organisation_more_than_one_site.yes.label'
      #   element :no, :gds_multiple_choice_option, 'questions.respondents_details.organisation_more_than_one_site.no.label'
      #
      #   element :employment_at_site_number, :inputtext_labelled, 'questions.respondents_details.organisation_more_than_one_site.employment_at_site_number.label', exact: false
      #
      #   element :error_inclusion, :exact_error_text, 'errors.custom.organisation_more_than_one_site.inclusion', exact: false
      #   element :error_not_a_number, :exact_error_text, 'errors.custom.organisation_more_than_one_site.not_a_number', exact: false
      #
      #   def set_for(user_persona)
      #     choose(factory_translate(user_persona.organisation_more_than_one_site), name: 'respondents_detail[organisation_more_than_one_site]')
      #     if t(user_persona.organisation_more_than_one_site) == t('questions.respondents_details.organisation_more_than_one_site.yes.label')
      #       employment_at_site_number.set(user_persona.employment_at_site_number)
      #     end
      #   end
      #
      #   def assert_answers_for(user_persona)
      #     find(:gds_multiple_choice_option,
      #          user_persona.organisation_more_than_one_site).assert_selector(:field, nil, checked: true) &&
      #     if t(user_persona.organisation_more_than_one_site) == t('questions.respondents_details.organisation_more_than_one_site.yes.label')
      #       root_element.
      #           assert_selector(
      #               :field,
      #               t('questions.respondents_details.organisation_more_than_one_site.employment_at_site_number.label'),
      #               with: user_persona.employment_at_site_number
      #           )
      #     end
      #   end
      # end

      gds_submit_button :continue_button, :'components.save_and_continue_button'
      element :save_and_complete_later_button, :link_named, "components.save_and_complete_later_button"
      def next
        continue_button.click
      end

      def save_and_complete_later
        save_and_complete_later_button.click
      end
    end
  end
end

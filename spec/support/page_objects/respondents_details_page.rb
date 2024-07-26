module ET3
  module Test
    class RespondentsDetailsPage < BasePage
      include EtTestHelpers::Page
      set_url '/respond/respondents_details'
      element :header, :content_header, 'respondents_details.header'
      element :error_header, :error_titled, 'errors.header', exact: true
      gds_text_input :case_number_question, :'questions.respondents_details.case_number.label', exact: false
      gds_text_input :name_question, :'questions.respondents_details.name.label', exact: false
      gds_text_input :company_number_question, :'questions.respondents_details.company_number'
      gds_select :type_of_employer_question, :'questions.respondents_details.type_of_employer'
      gds_select :title_question, :'questions.respondents_details.title'
      gds_text_input :other_title_question, :'questions.respondents_details.other_title'
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
      gds_text_input :organisation_employ_gb_question, :'questions.respondents_details.organisation_employ_gb.label', exact: false
      gds_radios :video_call_question, :'questions.respondents_details.video_call'
      gds_radios :organisation_more_than_one_site_question, :'questions.respondents_details.organisation_more_than_one_site'
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

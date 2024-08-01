module ET3
  module Test
    class YourRepresentativesDetailsPage < BasePage
      set_url '/respond/your_representatives_details'
      include EtTestHelpers::Page
      element :header, :content_header, 'your_representatives_details.header'
      element :error_header, :error_titled, 'errors.header', exact: true

      gds_radios :type_of_representative_question, :'questions.your_representatives_details.type_of_representative', exact: false
      gds_text_input :representative_org_name_question, :'questions.your_representatives_details.representative_org_name', exact: false
      gds_text_input :representative_name_question, :'questions.your_representatives_details.representative_name', exact: false
      gds_text_input :representative_building_question, :'questions.your_representatives_details.representative_building.label', exact: false
      gds_text_input :representative_street_question, :'questions.your_representatives_details.representative_street.label', exact: false
      gds_text_input :representative_town_question, :'questions.your_representatives_details.representative_town.label', exact: false
      gds_text_input :representative_county_question, :'questions.your_representatives_details.representative_county.label', exact: false
      gds_text_input :representative_postcode_question, :'questions.your_representatives_details.representative_postcode.label', exact: false
      gds_text_input :representative_phone_question, :'questions.your_representatives_details.representative_phone.label', exact: false
      gds_text_input :representative_mobile_question, :'questions.your_representatives_details.representative_mobile.label', exact: false
      gds_text_input :representative_dx_number_question, :'questions.your_representatives_details.representative_dx_number.label', exact: false
      gds_text_input :representative_reference_question, :'questions.your_representatives_details.representative_reference.label', exact: false
      gds_radios :representative_contact_preference_question, :'questions.your_representatives_details.representative_contact_preference', exact: false
      gds_text_input :preference_email, :'questions.your_representatives_details.preference_email'

      gds_submit_button :continue_button, :'components.save_and_continue_button'
      def next
        continue_button.click
      end
    end
  end
end

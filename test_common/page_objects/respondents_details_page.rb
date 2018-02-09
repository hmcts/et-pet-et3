module ET3
  module Test
    class RespondentsDetailsPage < BasePage
      set_url '/form/respondents_details'

      :element :case_number_question, :css, "#case_number"
      :element :name, :css, "#name_of_indiv_co_or_org"
      :element :contact_question, :css "#name_of_contact"
      :element :building_name_question, :css "#respondent_building_name_or_number"
      :element :street_question, :css "#respondent_street"
      :element :town_question, :css "#respondent_towncity"
      :element :county_question, :css "#respondent_county"
      :element :postcode_question, :css "#respondent_postcode"
      :element :dx_number_question, :css "#respondent_dx_address" # DX Address?
      :element :contact_number_question, :css "#respondent_contact_number"
      :element :contact_mobile_number_question, :css "#respondent_mobile_number"
      :elements :contact_preference_question, :css "fieldset span.xform-group label input.checkbox[name='How_would_you_prefer_us_to_contact_you']"
      :element :contact_detail_question, :css "#respondent_email_address, #respondent_fax_number"
      :element :organisation_employ_gb_question, :css "#how_many_people_employed_in_gb"
      :element :organisation_site_number_question, :css "fieldset span.xform-group label input.checkbox[name='more_than_one_site_in_gb']"
      :element :employment_at_site_question, :css, "#if_yes_how_many_people"
      
    end
  end
end
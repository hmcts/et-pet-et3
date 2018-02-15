module ET3
  module Test
    class RespondentsDetailsPage < BasePage
      set_url '/respond/respondents_details'

      element :case_number_question, :css, "#case_number"
      element :name_question, :css, "#name_of_indiv_co_or_org"
      element :contact_question, :css, "#name_of_contact"
      element :building_name_question, :css, "#respondent_building_name_or_number"
      element :street_question, :css, "#respondent_street"
      element :town_question, :css, "#respondent_towncity"
      element :county_question, :css, "#respondent_county"
      element :postcode_question, :css, "#respondent_postcode"
      element :dx_number_question, :css, "#respondent_dx_address" # DX Address?
      element :contact_number_question, :css, "#respondent_contact_number"
      element :contact_mobile_number_question, :css, "#respondent_mobile_number"
      section :contact_preference_question, :css, "#question12" do |q|
        element :preference_email, :css, '#respondents_detail_contact_preference_email'
        element :preference_post, :css, '#respondents_detail_contact_preference_post'
        element :preference_fax, :css, '#respondents_detail_contact_preference_fax'
        element :email_address, :css, '#respondent_contact_email'
        element :fax_number, :css, '#respondent_contact_fax'

        def set_for(user_persona)
          case user_persona.contact_preference
            when "email"
              preference_email.set(true)
              email_address.set(user_persona.email_address)
            when "post"
              preference_post.set(true)
            when "fax"
              preference_fax.set(true)
              fax_number.set(user_persona.fax_number)
          end
        end
      end
      element :organisation_employ_gb_question, :css, "#respondent_organisation_employ_gb"
      section :organisation_site_number_question, :css, "#question14" do |q|
        element :more_than_one_site, :css, '#respondents_detail_organisation_site_number_yes'
        element :only_one_site, :css, '#respondents_detail_organisation_site_number_no'
        element :employment_at_site_number, :css, '#respondent_employment_at_site_number'

        def set_for(user_persona)
          if user_persona.organisation_site_number > 1
            more_than_one_site.set(true)
            employment_at_site_number.set(user_persona.employment_at_site)
          end
        end
      end
      element :continue_button, :button, "Save and continue"
      def next
        continue_button.click
      end
    end
  end
end
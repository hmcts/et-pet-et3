module ET3
  module Test
    class RespondentsDetailsPage < BasePage
      set_url '/respond/respondents_details'

      section :case_number_question, :question_labelled, 'questions.case_number.label', exact: true do
        element :field, :css, "input"

        delegate :set, to: :field
      end

      section :name_question, :question_labelled, 'questions.name.label', exact: true do
        element :field, :css, "input"

        delegate :set, to: :field
      end

      section :contact_question, :question_labelled, 'questions.contact.label', exact: true do
        element :field, :css, "input"

        delegate :set, to: :field
      end

      section :building_name_question, :question_labelled, 'questions.building_name.label', exact: true do
        element :field, :css, "input"

        delegate :set, to: :field
      end
      
      section :street_question, :question_labelled, 'questions.street.label', exact: true do
        element :field, :css, "input"

        delegate :set, to: :field
      end
            
      section :town_question, :question_labelled, 'questions.town.label', exact: true do
        element :field, :css, "input"

        delegate :set, to: :field
      end
            
      section :county_question, :question_labelled, 'questions.county.label', exact: true do
        element :field, :css, "input"

        delegate :set, to: :field
      end

      section :postcode_question, :question_labelled, 'questions.postcode.label', exact: true do
        element :field, :css, "input"

        delegate :set, to: :field
      end
            
      section :dx_number_question, :question_labelled, 'questions.dx_number.label', exact: true do
        element :field, :css, "input"

        delegate :set, to: :field
      end
            
      section :contact_number_question, :question_labelled, 'questions.contact_number.label', exact: true do
        element :field, :css, "input"

        delegate :set, to: :field
      end
            
      section :contact_mobile_number_question, :question_labelled, 'questions.contact_mobile_number.label', exact: true do
        element :field, :css, "input"

        delegate :set, to: :field
      end

      section :contact_preference_question, :single_choice_option, 'questions.contact_preference.label', exact: true do |q|

        section :select_email, :gds_multiple_choice_option, 'questions.contact_preference.email.label' do
          element :selector, :css, 'input[type="radio"]'

          delegate :set, to: :selector
        end

        section :select_post, :gds_multiple_choice_option, 'questions.contact_preference.post.label' do
          element :selector, :css, 'input[type="radio"]'

          delegate :set, to: :selector
        end

        section :select_fax, :gds_multiple_choice_option, 'questions.contact_preference.fax.label' do
          element :selector, :css, 'input[type="radio"]'

          delegate :set, to: :selector
        end

        section :preference_email, :inputtext_labelled, 'questions.contact_preference.email.input_label' do
          delegate :set, to: :root_element
        end

        section :preference_fax, :inputtext_labelled, 'questions.contact_preference.fax.input_label' do
          delegate :set, to: :root_element
        end

        def set_for(user_persona)
          case user_persona.contact_preference
            when "email"
              select_email.set(true)
              preference_email.set(user_persona.email_address)
            when "post"
              select_post.set(true)
            when "fax"
              select_fax.set(true)
              preference_fax.set(user_persona.fax_number)
          end
        end
      end
            
      section :organisation_employ_gb_question, :question_labelled, 'questions.organisation_employ_gb.label', exact: true do
        element :field, :css, "input"

        delegate :set, to: :field
      end
      
      section :organisation_more_than_one_site_question, :single_choice_option, 'questions.organisation_more_than_one_site.label', exact: true do |q|
        
        section :yes, :gds_multiple_choice_option, 'questions.organisation_more_than_one_site.yes.label', exact: true do
          element :selector, :css, 'input'
          
          delegate :set, to: :selector
        end

        section :no, :gds_multiple_choice_option, 'questions.organisation_more_than_one_site.no.label', exact: true do
          element :selector, :css, 'input'

          delegate :set, to: :selector
        end

        section :employment_at_site_number, :inputtext_labelled, 'questions.organisation_more_than_one_site.employment_at_site.label', exact: true do
          delegate :set, to: :root_element
        end

        def set_for(user_persona)
          if user_persona.organisation_site_number == 'Yes'
            yes.set(true)
            employment_at_site.set(user_persona.employment_at_site)
          else 
            no.set(true)
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
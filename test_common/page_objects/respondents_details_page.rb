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

        section :preference_email, :fieldset_question_labelled, 'questions.contact_preference.email.label' do
          element :selector, :css, 'input[type="radio"]'
          element :field, :css, 'input[type="text"]'

          def set(value)
            selector.set(true)
            field.set(value)
          end
        end

        section :preference_post, :fieldset_question_labelled, 'questions.contact_preference.post.label' do
          element :selector, :css, 'input[type="radio"]'

          delegate :set, to: :selector
        end

        section :preference_fax, :fieldset_question_labelled, 'questions.contact_preference.fax.label' do
          element :selector, :css, 'input[type="radio"]'
          element :field, :css, 'input[type="text"]'

          def set(value)
            selector.set(true)
            field.set(value)
          end
        end

        def set_for(user_persona)
          case user_persona.contact_preference
            when "email"
              preference_email.set(user_persona.email_address)
            when "post"
              preference_post.set(true)
            when "fax"
              preference_fax.set(user_persona.fax_number)
          end
        end
      end
            
      section :organisation_employ_gb_question, :question_labelled, 'questions.organisation_employ_gb.label', exact: true do
        element :field, :css, "input"

        delegate :set, to: :field
      end
      
      section :organisation_site_number_question, :single_choice_option, 'questions.organisation_site_number.label', exact: true do |q|
        
        section :more_than_one_site, :fieldset_question_labelled, 'questions.organisation_site_number.more_than_one_site.label', exact: true do
          element :selector, :css, 'input[type="radio"]'
          element :field, :css, 'input[type="text"]'

          def set(value)
            selector.set(true)
            field.set(value)
          end
        end

        section :only_one_site, :fieldset_question_labelled, 'questions.organisation_site_number.only_one_site.label', exact: true do
          element :selector, :css, 'input[type="radio"]'

          delegate :set, to: :selector
        end

        def set_for(user_persona)
          if user_persona.organisation_site_number > 1
            more_than_one_site.set(user_persona.employment_at_site)
          else 
            only_one_site.set(true)
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
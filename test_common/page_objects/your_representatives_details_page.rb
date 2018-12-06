module ET3
  module Test
    class YourRepresentativesDetailsPage < BasePage
      set_url '/respond/your_representatives_details'

      element :error_header, :error_titled, 'errors.header', exact: true

      section :type_of_representative_question, :single_choice_option, 'questions.type_of_representative.label', exact: false do
        include ET3::Test::I18n
        
        section :citizens_advice_bureau, :gds_multiple_choice_option, 'questions.type_of_representative.citizens_advice_bureau.label', exact: true do
          element :selector, :css, 'input'

          delegate :set, to: :selector
        end

        section :free_representation_unit, :gds_multiple_choice_option, 'questions.type_of_representative.free_representation_unit.label', exact: true do
          element :selector, :css, 'input'

          delegate :set, to: :selector
        end

        section :law_centre, :gds_multiple_choice_option, 'questions.type_of_representative.law_centre.label', exact: true do
          element :selector, :css, 'input'

          delegate :set, to: :selector
        end

        section :union, :gds_multiple_choice_option, 'questions.type_of_representative.union.label', exact: true do
          element :selector, :css, 'input'

          delegate :set, to: :selector
        end

        section :solicitor, :gds_multiple_choice_option, 'questions.type_of_representative.solicitor.label', exact: true do
          element :selector, :css, 'input'

          delegate :set, to: :selector
        end

        section :private_individual, :gds_multiple_choice_option, 'questions.type_of_representative.private_individual.label', exact: true do
          element :selector, :css, 'input'

          delegate :set, to: :selector
        end

        section :trade_association, :gds_multiple_choice_option, 'questions.type_of_representative.trade_association.label', exact: true do
          element :selector, :css, 'input'

          delegate :set, to: :selector
        end

        section :other, :gds_multiple_choice_option, 'questions.type_of_representative.other.label', exact: true do
          element :selector, :css, 'input'

          delegate :set, to: :selector
        end

        element :error_inclusion, :exact_error_text, 'errors.custom.type_of_representative.inclusion', exact: false

        def set_for(user_persona)
          case user_persona.type_of_representative
            when t('questions.type_of_representative.citizens_advice_bureau.label')
              citizens_advice_bureau.set(true)
            when t('questions.type_of_representative.free_representation_unit.label')
              free_representation_unit.set(true)
            when t('questions.type_of_representative.law_centre.label')
              law_centre.set(true)
            when t('questions.type_of_representative.union.label')
              union.set(true)
            when t('questions.type_of_representative.solicitor.label')
              solicitor.set(true)
            when t('questions.type_of_representative.private_individual.label')
              private_individual.set(true)
            when t('questions.type_of_representative.trade_association.label')
              trade_association.set(true)
            when t('questions.type_of_representative.other.label')
              other.set(true)
          end
        end
      end

      section :representative_org_name_question, :question_labelled, 'questions.representative_org_name.label', exact: false do
        element :field, :css, "input"

        delegate :set, to: :field
      end

      section :representative_name_question, :question_labelled, 'questions.representative_name.label', exact: false do
        element :field, :css, "input"

        element :error_contains_numbers, :exact_error_text, 'errors.messages.contains_numbers', exact: false
        element :error_blank, :exact_error_text, 'errors.messages.blank', exact: false
        element :error_invalid_name, :exact_error_text, 'errors.messages.invalid_name', exact: false

        delegate :set, to: :field
      end

      section :representative_building_question, :question_labelled, 'questions.representative_building.label', exact: false do
        element :field, :css, "input"

        element :error_blank, :exact_error_text, 'errors.messages.blank', exact: false

        delegate :set, to: :field
      end

      section :representative_street_question, :question_labelled, 'questions.representative_street.label', exact: false do
        element :field, :css, "input"

        element :error_blank, :exact_error_text, 'errors.messages.blank', exact: false

        delegate :set, to: :field
      end

      section :representative_town_question, :question_labelled, 'questions.representative_town.label', exact: false do
        element :field, :css, "input"

        element :error_blank, :exact_error_text, 'errors.messages.blank', exact: false

        delegate :set, to: :field
      end

      section :representative_county_question, :question_labelled, 'questions.representative_county.label', exact: false do
        element :field, :css, "input"

        delegate :set, to: :field
      end

      section :representative_postcode_question, :question_labelled, 'questions.representative_postcode.label', exact: false do
        element :field, :css, "input"

        element :error_invalid_postcode, :exact_error_text, 'errors.messages.invalid_postcode', exact: false

        delegate :set, to: :field
      end

      section :representative_phone_question, :question_labelled, 'questions.representative_phone.label', exact: false do
        element :field, :css, "input"

        element :error_invalid_phone_number, :exact_error_text, 'errors.messages.invalid_phone_number', exact: false

        delegate :set, to: :field
      end

      section :representative_mobile_question, :question_labelled, 'questions.representative_mobile.label', exact: false do
        element :field, :css, "input"

        element :error_invalid_phone_number, :exact_error_text, 'errors.messages.invalid_phone_number', exact: false

        delegate :set, to: :field
      end

      section :representative_dx_number_question, :question_labelled, 'questions.representative_dx_number.label', exact: false do
        element :field, :css, "input"

        delegate :set, to: :field
      end

      section :representative_reference_question, :question_labelled, 'questions.representative_reference.label', exact: false do
        element :field, :css, "input"

        delegate :set, to: :field
      end

      section :representative_contact_preference_question, :single_choice_option, 'questions.representative_contact_preference.label', exact: false do
        
        section :select_email, :gds_multiple_choice_option, 'questions.representative_contact_preference.email.label' do
          element :selector, :css, 'input[type="radio"]'

          delegate :set, to: :selector
        end

        section :select_post, :gds_multiple_choice_option, 'questions.representative_contact_preference.post.label' do
          element :selector, :css, 'input[type="radio"]'

          delegate :set, to: :selector
        end

        section :select_fax, :gds_multiple_choice_option, 'questions.representative_contact_preference.fax.label' do
          element :selector, :css, 'input[type="radio"]'

          delegate :set, to: :selector
        end

        section :preference_email, :inputtext_labelled, 'questions.representative_contact_preference.email.input_label' do
          delegate :set, to: :root_element
        end

        section :preference_fax, :inputtext_labelled, 'questions.representative_contact_preference.fax.input_label' do
          delegate :set, to: :root_element
        end

        element :error_invalid_email, :exact_error_text, 'errors.messages.invalid_email', exact: false
        element :error_invalid_fax, :exact_error_text, 'errors.messages.invalid_phone_number', exact: false

        def set_for(user_persona)
          case user_persona.representative_contact_preference
            when "Email"
              select_email.set(true)
              preference_email.set(user_persona.representative_email)
            when "Post"
              select_post.set(true)
            when "Fax"
              select_fax.set(true)
              preference_fax.set(user_persona.representative_fax)
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

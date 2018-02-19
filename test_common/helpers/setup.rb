module ET3
  module Test
    module Setup

      attr_accessor :user

      def given_i_am(company_name)
        self.user = personas.fetch(company_name)
      end

      def answer_case_number_question
        respondents_details_page.case_number_question.set(user.case_number)
      end

      def answer_name_question
        respondents_details_page.name_question.set(user.name)
      end

      def answer_contact_question
        respondents_details_page.contact_question.set(user.contact)
      end

      def answer_building_name_question
        respondents_details_page.building_name_question.set(user.building_name)
      end

      def answer_street_question
        respondents_details_page.street_question.set(user.street_name)
      end

      def answer_town_question
        respondents_details_page.town_question.set(user.town)
      end

      def answer_postcode_question
        respondents_details_page.postcode_question.set(user.postcode)
      end

      # Not currently used in test suite
      def answer_dx_number_question
        respondents_details_page.dx_number_question.set(user.dx_number)
      end

      def answer_contact_number_question
        respondents_details_page.contact_number_question.set(user.contact_number)
      end

      def answer_mobile_number_question
        respondents_details_page.mobile_number_question.set(user.mobile_number)
      end

      def answer_contact_preference_question
        respondents_details_page.contact_preference_question.set_for(user)
      end

      def answer_organisation_employ_gb_question
        respondents_details_page.organisation_employ_gb_question.set(user.answer_organisation_employ_gb)
      end

      def answer_organisation_site_number_question
        respondents_details_page.organisation_site_number_question.set_for(user)
      end
    end
  end
end

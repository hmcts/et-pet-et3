module ET3
  module Test
    class EmployersContractClaimPage < BasePage
      set_url '/respond/employers_contract_claim'

      section :make_employer_contract_claim_question, :single_choice_option, 'questions.make_employer_contract_claim.label', exact: true do

        section :no, :gds_multiple_choice_option, 'questions.make_employer_contract_claim.no.label', exact: true do
          element :selector, :css, 'input'

          delegate :set, to: :selector
        end

        section :yes, :gds_multiple_choice_option, 'questions.make_employer_contract_claim.yes.label', exact: true do
          element :selector, :css, 'input'

          delegate :set, to: :selector
        end

        section :claim_information, :textarea_labelled, 'questions.make_employer_contract_claim.claim_information.label', exact: true do
          delegate :set, to: :root_element
        end

        def set_for(user_persona)
          if user_persona.make_employer_contract_claim
            yes.set(true)
            claim_information.set(user_persona.claim_information)
          else
            no.set(true)
          end
        end
      end
      
      #TODO: Build appropriate selector
      section :upload_additional_information, :BUILD_SELECTOR, 'questions.make_employer_contract_claim.upload_additional_information.label', exact: true do

      end
    end
  end
end

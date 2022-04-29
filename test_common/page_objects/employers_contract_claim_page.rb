module ET3
  module Test
    class EmployersContractClaimPage < BasePage
      include EtTestHelpers::Page
      set_url '/respond/employers_contract_claim'
      element :header, :content_header, 'employer_contract_claim.header'
      element :description, :element_with_text, 'employer_contract_claim.description'
      element :error_header, :error_titled, 'errors.header', exact: true

      gds_radios :make_employer_contract_claim_question, :'questions.employers_contract_claims.make_employer_contract_claim'
      gds_text_area :claim_information, :'questions.employers_contract_claims.claim_information'

      gds_submit_button :continue_button, :'components.save_and_continue_button'
      def next
        continue_button.click
      end
    end
  end
end

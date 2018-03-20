module ET3
  module Test
    module Pages
      def start_page
        ET3::Test::StartPage.new
      end

      def respondents_details_page
        ET3::Test::RespondentsDetailsPage.new
      end

      def claimants_details_page
        ET3::Test::ClaimantsDetailsPage.new
      end

      def earnings_and_benefits_page
        ET3::Test::EarningsAndBenefitsPage.new
      end

      def response_page
        ET3::Test::ResponsePage.new
      end

      def your_representative_page
        ET3::Test::YourRepresentativePage.new
      end

      def your_representatives_details_page
        ET3::Test::YourRepresentativesDetailsPage.new
      end

      def employers_contract_claim_page
        ET3::Test::EmployersContractClaimPage.new
      end

      def confirmation_of_supplied_details_page
        ET3::Test::ConfirmationOfSuppliedDetailsPage.new
      end

      def form_submission_page
        ET3::Test::FormSubmissionPage.new
      end
      
      # Define other pages here
    end
  end
end

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
        ET3::Test::YourRepresentativePage
      end

      # Define other pages here
    end
  end
end

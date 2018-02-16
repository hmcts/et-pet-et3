module ET3
  module Test
    module Pages
      def start_page
        ET3::Test::StartPage.new
      end

      def respondents_details_page
        ET3::Test::RespondentsDetailsPage.new
      end

      # Define other pages here
    end
  end
end

module ET3
  module Test
    class StartPage < BasePage
      set_url '/'

      element :header, :css, ".content-header"

      element :introduction, :css, ".introduction"
      
      element :start_button, :css, ".button.button-start"

      def next
        start_button.click
      end
    end
  end
end

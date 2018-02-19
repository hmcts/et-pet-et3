module ET3
  module Test
    class StartPage < BasePage
      set_url '/'

      element :hello_world, :css, ".header"
      # Populate here
    end
  end
end
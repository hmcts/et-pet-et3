Capybara.add_selector(:gds_multiple_choice_option) do
  xpath do |_locator, _options|
    XPath.generate { |x| x.css('.multiple-choice') }
  end
end

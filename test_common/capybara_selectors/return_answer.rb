Capybara.add_selector(:return_answer) do
  xpath do |_locator, _options|
    XPath.generate { |x| x.descendant(:td)[2] }
  end
end

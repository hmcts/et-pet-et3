Capybara.add_selector(:single_choice_option) do
  xpath do |locator, _options|
    translated = ET3::Test::Messaging.instance.translate(locator)
    XPath.generate { |x| x.css('.form-group')[x.descendant(:fieldset)[x.descendant(:legend)[x.string.n.is(translated)]]] }
  end
end

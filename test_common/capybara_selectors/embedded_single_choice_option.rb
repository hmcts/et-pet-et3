Capybara.add_selector(:embedded_single_choice_option) do
  xpath do |locator, _options|
    translated = ET3::Test::Messaging.instance.translate(locator)
    XPath.generate { |x| x.descendant(:div)[x.child(:fieldset)[x.child(:legend)[x.string.n.is(translated)]]] }
  end
end

Capybara.add_selector(:fieldset_question_labelled) do
  xpath do |locator, _options|
    translated = ET3::Test::Messaging.instance.translate(locator)
    XPath.generate { |x| x.css('fieldset')[x.descendant(:label)[x.string.n.is(translated)]] }
  end
end

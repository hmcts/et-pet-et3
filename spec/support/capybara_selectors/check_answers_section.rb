Capybara.add_selector(:check_answers_section) do
  label "GOVUK check answers section"
  xpath do |locator, _options|
    translated = ET3::Test::Messaging.instance.translate(locator)
    # Helps with nicer error messages from rspec etc..
    @definition.label("GOVUK check answers section <#{translated}> (#{locator})")
    XPath.generate { |x| x.css('.govuk-summary-list')[x.previous_sibling(:h2)[x.string.n.equals(translated)]] }
  end
end

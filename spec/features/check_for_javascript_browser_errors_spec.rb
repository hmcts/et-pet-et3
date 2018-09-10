require 'rails_helper'

RSpec.feature "Check for Javascript Browser Errors", js: true, driver: :chromedriver do
  include ET3::Test::I18n

  after(:each) do
    base_page.clear_browser_logs
  end

  scenario "on start page" do
    start_page.load

    expect(start_page.js_severe_errors).to be_empty
  end

  scenario "on respondent's details page" do
    respondents_details_page.load

    expect(respondents_details_page.js_severe_errors).to be_empty
  end

  scenario "on claimant's details page" do
    claimants_details_page.load

    expect(claimants_details_page.js_severe_errors).to be_empty
  end

  scenario "on earnings and benefits page" do
    earnings_and_benefits_page.load

    expect(earnings_and_benefits_page.js_severe_errors).to be_empty
  end

  scenario "response page" do
    response_page.load

    expect(response_page.js_severe_errors).to be_empty
  end

  scenario "your representative page" do
    your_representative_page.load

    expect(your_representative_page.js_severe_errors).to be_empty
  end

  scenario "your representative's details page" do
    your_representatives_details_page.load

    expect(your_representatives_details_page.js_severe_errors).to be_empty
  end

  scenario "disability page" do
    disability_page.load

    expect(disability_page.js_severe_errors).to be_empty
  end

  scenario "employer contract claim page" do
    employers_contract_claim_page.load

    expect(employers_contract_claim_page.js_severe_errors).to be_empty
  end

  scenario "additional information page" do
    additional_information_page.load

    expect(additional_information_page.js_severe_errors).to be_empty
  end

  scenario "confirmation of supplied details page" do
    confirmation_of_supplied_details_page.load

    expect(confirmation_of_supplied_details_page.js_severe_errors).to be_empty
  end

  scenario "form submission page" do
    given_i_am(:company01)
    answer_all_questions
    confirmation_of_supplied_details_page.submit_form

    expect(form_submission_page.js_severe_errors).to be_empty
  end

end

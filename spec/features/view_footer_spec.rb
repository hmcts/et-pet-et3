require 'rails_helper'

RSpec.feature "View Footer", js: true do
  include ET3::Test::I18n

  before do
    stub_et_api
    stub_presigned_url_api_for_s3
  end

  scenario "on start page" do
    start_page.load(locale: current_locale_parameter)

    expect(start_page).to have_link(t('components.footer.terms'), href: terms_and_conditions_path)
  end

  scenario "on respondent's details page" do
    respondents_details_page.load(locale: current_locale_parameter)

    expect(respondents_details_page).to have_link(t('components.footer.terms'), href: terms_and_conditions_path)
  end

  scenario "on claimant's details page" do
    claimants_details_page.load(locale: current_locale_parameter)

    expect(claimants_details_page).to have_link(t('components.footer.terms'), href: terms_and_conditions_path)
  end

  scenario "on earnings and benefits page" do
    earnings_and_benefits_page.load(locale: current_locale_parameter)

    expect(earnings_and_benefits_page).to have_link(t('components.footer.terms'), href: terms_and_conditions_path)
  end

  scenario "on response page" do
    response_page.load(locale: current_locale_parameter)

    expect(response_page).to have_link(t('components.footer.terms'), href: terms_and_conditions_path)
  end

  scenario "on your representative page" do
    your_representative_page.load(locale: current_locale_parameter)

    expect(your_representative_page).to have_link(t('components.footer.terms'), href: terms_and_conditions_path)
  end

  scenario "on your representative's details page" do
    your_representatives_details_page.load(locale: current_locale_parameter)

    expect(your_representatives_details_page).to have_link(t('components.footer.terms'), href: terms_and_conditions_path)
  end

  scenario "on disability page" do
    disability_page.load(locale: current_locale_parameter)

    expect(disability_page).to have_link(t('components.footer.terms'), href: terms_and_conditions_path)
  end

  scenario "on employer contract claim page" do
    employers_contract_claim_page.load(locale: current_locale_parameter)

    expect(employers_contract_claim_page).to have_link(t('components.footer.terms'), href: terms_and_conditions_path)
  end

  scenario "on additional information page" do
    additional_information_page.load(locale: current_locale_parameter)

    expect(additional_information_page).to have_link(t('components.footer.terms'), href: terms_and_conditions_path)
  end

  scenario "on confirmation of supplied details page" do
    confirmation_of_supplied_details_page.load(locale: current_locale_parameter)

    expect(confirmation_of_supplied_details_page).to have_link(t('components.footer.terms'), href: terms_and_conditions_path)
  end

  scenario "on form submission page" do
    given_valid_data
    start_a_new_et3_response
    answer_respondents_details
    answer_claimants_details
    answer_earnings_and_benefits
    answer_defend_claim_question
    answer_representative
    answer_disability_question
    answer_employers_contract_claim
    answer_additional_information
    answer_confirmation_of_supplied_details

    expect(form_submission_page).to have_link(t('components.footer.terms'), href: terms_and_conditions_path)
  end

end

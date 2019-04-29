require 'rails_helper'

RSpec.feature "Access Terms", js: true do
  include ET3::Test::I18n

  before do
    stub_et_api
    stub_build_blob_to_azure
  end

  scenario "from start page" do
    start_page.load(locale: current_locale_parameter)

    start_page.terms.click

    expect(terms_and_conditions_page).to be_displayed
    expect(terms_and_conditions_page).to have_header

    expect(terms_and_conditions_page).to have_introduction

    expect(terms_and_conditions_page.who_we_are).to have_header
    terms_and_conditions_page.who_we_are.assert_content

    expect(terms_and_conditions_page.info_provided).to have_header
    terms_and_conditions_page.info_provided.assert_content

    expect(terms_and_conditions_page.sharing_storing_data).to have_header
    terms_and_conditions_page.sharing_storing_data.assert_content

    expect(terms_and_conditions_page.laws_applied).to have_header
    terms_and_conditions_page.laws_applied.assert_content

    expect(terms_and_conditions_page.how_to_use).to have_header
    terms_and_conditions_page.how_to_use.assert_content

    expect(terms_and_conditions_page.entering_sensitive_info).to have_header
    terms_and_conditions_page.entering_sensitive_info.assert_content

    expect(terms_and_conditions_page.disclaimer).to have_header
    terms_and_conditions_page.disclaimer.assert_content
  end

  scenario "from respondent's details page" do
    respondents_details_page.load(locale: current_locale_parameter)

    respondents_details_page.terms.click

    expect(terms_and_conditions_page).to be_displayed
    expect(terms_and_conditions_page).to have_header

    expect(terms_and_conditions_page).to have_introduction

    expect(terms_and_conditions_page.who_we_are).to have_header
    terms_and_conditions_page.who_we_are.assert_content

    expect(terms_and_conditions_page.info_provided).to have_header
    terms_and_conditions_page.info_provided.assert_content

    expect(terms_and_conditions_page.sharing_storing_data).to have_header
    terms_and_conditions_page.sharing_storing_data.assert_content

    expect(terms_and_conditions_page.laws_applied).to have_header
    terms_and_conditions_page.laws_applied.assert_content

    expect(terms_and_conditions_page.how_to_use).to have_header
    terms_and_conditions_page.how_to_use.assert_content

    expect(terms_and_conditions_page.entering_sensitive_info).to have_header
    terms_and_conditions_page.entering_sensitive_info.assert_content

    expect(terms_and_conditions_page.disclaimer).to have_header
    terms_and_conditions_page.disclaimer.assert_content
  end

  scenario "from claimant's details page" do
    claimants_details_page.load(locale: current_locale_parameter)

    claimants_details_page.terms.click

    expect(terms_and_conditions_page).to be_displayed
    expect(terms_and_conditions_page).to have_header

    expect(terms_and_conditions_page).to have_introduction

    expect(terms_and_conditions_page.who_we_are).to have_header
    terms_and_conditions_page.who_we_are.assert_content

    expect(terms_and_conditions_page.info_provided).to have_header
    terms_and_conditions_page.info_provided.assert_content

    expect(terms_and_conditions_page.sharing_storing_data).to have_header
    terms_and_conditions_page.sharing_storing_data.assert_content

    expect(terms_and_conditions_page.laws_applied).to have_header
    terms_and_conditions_page.laws_applied.assert_content

    expect(terms_and_conditions_page.how_to_use).to have_header
    terms_and_conditions_page.how_to_use.assert_content

    expect(terms_and_conditions_page.entering_sensitive_info).to have_header
    terms_and_conditions_page.entering_sensitive_info.assert_content

    expect(terms_and_conditions_page.disclaimer).to have_header
    terms_and_conditions_page.disclaimer.assert_content
  end

  scenario "from earnings and benefits page" do
    earnings_and_benefits_page.load(locale: current_locale_parameter)

    earnings_and_benefits_page.terms.click

    expect(terms_and_conditions_page).to be_displayed
    expect(terms_and_conditions_page).to have_header

    expect(terms_and_conditions_page).to have_introduction

    expect(terms_and_conditions_page.who_we_are).to have_header
    terms_and_conditions_page.who_we_are.assert_content

    expect(terms_and_conditions_page.info_provided).to have_header
    terms_and_conditions_page.info_provided.assert_content

    expect(terms_and_conditions_page.sharing_storing_data).to have_header
    terms_and_conditions_page.sharing_storing_data.assert_content

    expect(terms_and_conditions_page.laws_applied).to have_header
    terms_and_conditions_page.laws_applied.assert_content

    expect(terms_and_conditions_page.how_to_use).to have_header
    terms_and_conditions_page.how_to_use.assert_content

    expect(terms_and_conditions_page.entering_sensitive_info).to have_header
    terms_and_conditions_page.entering_sensitive_info.assert_content

    expect(terms_and_conditions_page.disclaimer).to have_header
    terms_and_conditions_page.disclaimer.assert_content
  end

  scenario "from response page" do
    response_page.load(locale: current_locale_parameter)

    response_page.terms.click

    expect(terms_and_conditions_page).to be_displayed
    expect(terms_and_conditions_page).to have_header

    expect(terms_and_conditions_page).to have_introduction

    expect(terms_and_conditions_page.who_we_are).to have_header
    terms_and_conditions_page.who_we_are.assert_content

    expect(terms_and_conditions_page.info_provided).to have_header
    terms_and_conditions_page.info_provided.assert_content

    expect(terms_and_conditions_page.sharing_storing_data).to have_header
    terms_and_conditions_page.sharing_storing_data.assert_content

    expect(terms_and_conditions_page.laws_applied).to have_header
    terms_and_conditions_page.laws_applied.assert_content

    expect(terms_and_conditions_page.how_to_use).to have_header
    terms_and_conditions_page.how_to_use.assert_content

    expect(terms_and_conditions_page.entering_sensitive_info).to have_header
    terms_and_conditions_page.entering_sensitive_info.assert_content

    expect(terms_and_conditions_page.disclaimer).to have_header
    terms_and_conditions_page.disclaimer.assert_content
  end

    scenario "from your representative page" do
    your_representative_page.load(locale: current_locale_parameter)

    your_representative_page.terms.click

    expect(terms_and_conditions_page).to be_displayed
    expect(terms_and_conditions_page).to have_header

    expect(terms_and_conditions_page).to have_introduction

    expect(terms_and_conditions_page.who_we_are).to have_header
    terms_and_conditions_page.who_we_are.assert_content

    expect(terms_and_conditions_page.info_provided).to have_header
    terms_and_conditions_page.info_provided.assert_content

    expect(terms_and_conditions_page.sharing_storing_data).to have_header
    terms_and_conditions_page.sharing_storing_data.assert_content

    expect(terms_and_conditions_page.laws_applied).to have_header
    terms_and_conditions_page.laws_applied.assert_content

    expect(terms_and_conditions_page.how_to_use).to have_header
    terms_and_conditions_page.how_to_use.assert_content

    expect(terms_and_conditions_page.entering_sensitive_info).to have_header
    terms_and_conditions_page.entering_sensitive_info.assert_content

    expect(terms_and_conditions_page.disclaimer).to have_header
    terms_and_conditions_page.disclaimer.assert_content
  end

  scenario "from your representative's details page" do
    your_representatives_details_page.load(locale: current_locale_parameter)

    your_representatives_details_page.terms.click

    expect(terms_and_conditions_page).to be_displayed
    expect(terms_and_conditions_page).to have_header

    expect(terms_and_conditions_page).to have_introduction

    expect(terms_and_conditions_page.who_we_are).to have_header
    terms_and_conditions_page.who_we_are.assert_content

    expect(terms_and_conditions_page.info_provided).to have_header
    terms_and_conditions_page.info_provided.assert_content

    expect(terms_and_conditions_page.sharing_storing_data).to have_header
    terms_and_conditions_page.sharing_storing_data.assert_content

    expect(terms_and_conditions_page.laws_applied).to have_header
    terms_and_conditions_page.laws_applied.assert_content

    expect(terms_and_conditions_page.how_to_use).to have_header
    terms_and_conditions_page.how_to_use.assert_content

    expect(terms_and_conditions_page.entering_sensitive_info).to have_header
    terms_and_conditions_page.entering_sensitive_info.assert_content

    expect(terms_and_conditions_page.disclaimer).to have_header
    terms_and_conditions_page.disclaimer.assert_content
  end

  scenario "from disability page" do
    disability_page.load(locale: current_locale_parameter)

    disability_page.terms.click

    expect(terms_and_conditions_page).to be_displayed
    expect(terms_and_conditions_page).to have_header

    expect(terms_and_conditions_page).to have_introduction

    expect(terms_and_conditions_page.who_we_are).to have_header
    terms_and_conditions_page.who_we_are.assert_content

    expect(terms_and_conditions_page.info_provided).to have_header
    terms_and_conditions_page.info_provided.assert_content

    expect(terms_and_conditions_page.sharing_storing_data).to have_header
    terms_and_conditions_page.sharing_storing_data.assert_content

    expect(terms_and_conditions_page.laws_applied).to have_header
    terms_and_conditions_page.laws_applied.assert_content

    expect(terms_and_conditions_page.how_to_use).to have_header
    terms_and_conditions_page.how_to_use.assert_content

    expect(terms_and_conditions_page.entering_sensitive_info).to have_header
    terms_and_conditions_page.entering_sensitive_info.assert_content

    expect(terms_and_conditions_page.disclaimer).to have_header
    terms_and_conditions_page.disclaimer.assert_content
  end

  scenario "from employer contract claim page" do
    employers_contract_claim_page.load(locale: current_locale_parameter)

    employers_contract_claim_page.terms.click

    expect(terms_and_conditions_page).to be_displayed
    expect(terms_and_conditions_page).to have_header

    expect(terms_and_conditions_page).to have_introduction

    expect(terms_and_conditions_page.who_we_are).to have_header
    terms_and_conditions_page.who_we_are.assert_content

    expect(terms_and_conditions_page.info_provided).to have_header
    terms_and_conditions_page.info_provided.assert_content

    expect(terms_and_conditions_page.sharing_storing_data).to have_header
    terms_and_conditions_page.sharing_storing_data.assert_content

    expect(terms_and_conditions_page.laws_applied).to have_header
    terms_and_conditions_page.laws_applied.assert_content

    expect(terms_and_conditions_page.how_to_use).to have_header
    terms_and_conditions_page.how_to_use.assert_content

    expect(terms_and_conditions_page.entering_sensitive_info).to have_header
    terms_and_conditions_page.entering_sensitive_info.assert_content

    expect(terms_and_conditions_page.disclaimer).to have_header
    terms_and_conditions_page.disclaimer.assert_content
  end

  scenario "from additional information page" do
    additional_information_page.load(locale: current_locale_parameter)

    additional_information_page.terms.click

    expect(terms_and_conditions_page).to be_displayed
    expect(terms_and_conditions_page).to have_header

    expect(terms_and_conditions_page).to have_introduction

    expect(terms_and_conditions_page.who_we_are).to have_header
    terms_and_conditions_page.who_we_are.assert_content

    expect(terms_and_conditions_page.info_provided).to have_header
    terms_and_conditions_page.info_provided.assert_content

    expect(terms_and_conditions_page.sharing_storing_data).to have_header
    terms_and_conditions_page.sharing_storing_data.assert_content

    expect(terms_and_conditions_page.laws_applied).to have_header
    terms_and_conditions_page.laws_applied.assert_content

    expect(terms_and_conditions_page.how_to_use).to have_header
    terms_and_conditions_page.how_to_use.assert_content

    expect(terms_and_conditions_page.entering_sensitive_info).to have_header
    terms_and_conditions_page.entering_sensitive_info.assert_content

    expect(terms_and_conditions_page.disclaimer).to have_header
    terms_and_conditions_page.disclaimer.assert_content
  end

  scenario "from confirmation of supplied details page" do
    confirmation_of_supplied_details_page.load(locale: current_locale_parameter)

    confirmation_of_supplied_details_page.terms.click

    expect(terms_and_conditions_page).to be_displayed
    expect(terms_and_conditions_page).to have_header

    expect(terms_and_conditions_page).to have_introduction

    expect(terms_and_conditions_page.who_we_are).to have_header
    terms_and_conditions_page.who_we_are.assert_content

    expect(terms_and_conditions_page.info_provided).to have_header
    terms_and_conditions_page.info_provided.assert_content

    expect(terms_and_conditions_page.sharing_storing_data).to have_header
    terms_and_conditions_page.sharing_storing_data.assert_content

    expect(terms_and_conditions_page.laws_applied).to have_header
    terms_and_conditions_page.laws_applied.assert_content

    expect(terms_and_conditions_page.how_to_use).to have_header
    terms_and_conditions_page.how_to_use.assert_content

    expect(terms_and_conditions_page.entering_sensitive_info).to have_header
    terms_and_conditions_page.entering_sensitive_info.assert_content

    expect(terms_and_conditions_page.disclaimer).to have_header
    terms_and_conditions_page.disclaimer.assert_content
  end

  scenario "from form submission page" do
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

    form_submission_page.terms.click

    expect(terms_and_conditions_page).to be_displayed
    expect(terms_and_conditions_page).to have_header

    expect(terms_and_conditions_page).to have_introduction

    expect(terms_and_conditions_page.who_we_are).to have_header
    terms_and_conditions_page.who_we_are.assert_content

    expect(terms_and_conditions_page.info_provided).to have_header
    terms_and_conditions_page.info_provided.assert_content

    expect(terms_and_conditions_page.sharing_storing_data).to have_header
    terms_and_conditions_page.sharing_storing_data.assert_content

    expect(terms_and_conditions_page.laws_applied).to have_header
    terms_and_conditions_page.laws_applied.assert_content

    expect(terms_and_conditions_page.how_to_use).to have_header
    terms_and_conditions_page.how_to_use.assert_content

    expect(terms_and_conditions_page.entering_sensitive_info).to have_header
    terms_and_conditions_page.entering_sensitive_info.assert_content

    expect(terms_and_conditions_page.disclaimer).to have_header
    terms_and_conditions_page.disclaimer.assert_content
  end

end

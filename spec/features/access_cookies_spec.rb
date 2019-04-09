require 'rails_helper'

RSpec.feature "Access Cookies", js: true do
  include ET3::Test::I18n

  before do
    stub_et_api
    stub_build_blob_to_azure
  end

  scenario "from start page" do
    start_page.load(locale: current_locale_parameter)

    start_page.cookies.click

    expect(cookies_page).to be_displayed
    expect(cookies_page).to have_header

    expect(cookies_page).to have_introduction

    expect(cookies_page).to have_cookies_used_subheader

    expect(cookies_page.website_usage).to have_header
    cookies_page.website_usage.assert_content
    cookies_page.website_usage.assert_table

    expect(cookies_page.introductory_message).to have_header
    cookies_page.introductory_message.assert_content
    cookies_page.introductory_message.assert_table

    expect(cookies_page.store_answers).to have_header
    cookies_page.store_answers.assert_content
    cookies_page.store_answers.assert_table

    expect(cookies_page.more_secure).to have_header
    cookies_page.more_secure.assert_content
  end

  scenario "from respondent's details page" do
    respondents_details_page.load(locale: current_locale_parameter)

    respondents_details_page.cookies.click

    expect(cookies_page).to be_displayed
    expect(cookies_page).to have_header

    expect(cookies_page).to have_introduction

    expect(cookies_page).to have_cookies_used_subheader

    expect(cookies_page.website_usage).to have_header
    cookies_page.website_usage.assert_content
    cookies_page.website_usage.assert_table

    expect(cookies_page.introductory_message).to have_header
    cookies_page.introductory_message.assert_content
    cookies_page.introductory_message.assert_table

    expect(cookies_page.store_answers).to have_header
    cookies_page.store_answers.assert_content
    cookies_page.store_answers.assert_table

    expect(cookies_page.more_secure).to have_header
    cookies_page.more_secure.assert_content

  end

  scenario "from claimant's details page" do
    claimants_details_page.load(locale: current_locale_parameter)

    claimants_details_page.cookies.click

    expect(cookies_page).to be_displayed
    expect(cookies_page).to have_header

    expect(cookies_page).to have_introduction

    expect(cookies_page).to have_cookies_used_subheader

    expect(cookies_page.website_usage).to have_header
    cookies_page.website_usage.assert_content
    cookies_page.website_usage.assert_table

    expect(cookies_page.introductory_message).to have_header
    cookies_page.introductory_message.assert_content
    cookies_page.introductory_message.assert_table

    expect(cookies_page.store_answers).to have_header
    cookies_page.store_answers.assert_content
    cookies_page.store_answers.assert_table

    expect(cookies_page.more_secure).to have_header
    cookies_page.more_secure.assert_content

  end

  scenario "from earnings and benefits page" do
    earnings_and_benefits_page.load(locale: current_locale_parameter)

    earnings_and_benefits_page.cookies.click

    expect(cookies_page).to be_displayed
    expect(cookies_page).to have_header

    expect(cookies_page).to have_introduction

    expect(cookies_page).to have_cookies_used_subheader

    expect(cookies_page.website_usage).to have_header
    cookies_page.website_usage.assert_content
    cookies_page.website_usage.assert_table

    expect(cookies_page.introductory_message).to have_header
    cookies_page.introductory_message.assert_content
    cookies_page.introductory_message.assert_table

    expect(cookies_page.store_answers).to have_header
    cookies_page.store_answers.assert_content
    cookies_page.store_answers.assert_table

    expect(cookies_page.more_secure).to have_header
    cookies_page.more_secure.assert_content

  end

  scenario "from response page" do
    response_page.load(locale: current_locale_parameter)

    response_page.cookies.click


    expect(cookies_page).to be_displayed
    expect(cookies_page).to have_header

    expect(cookies_page).to have_introduction

    expect(cookies_page).to have_cookies_used_subheader

    expect(cookies_page.website_usage).to have_header
    cookies_page.website_usage.assert_content
    cookies_page.website_usage.assert_table

    expect(cookies_page.introductory_message).to have_header
    cookies_page.introductory_message.assert_content
    cookies_page.introductory_message.assert_table

    expect(cookies_page.store_answers).to have_header
    cookies_page.store_answers.assert_content
    cookies_page.store_answers.assert_table

    expect(cookies_page.more_secure).to have_header
    cookies_page.more_secure.assert_content

  end

  scenario "from your representative page" do
    your_representative_page.load(locale: current_locale_parameter)

    your_representative_page.cookies.click


    expect(cookies_page).to be_displayed
    expect(cookies_page).to have_header

    expect(cookies_page).to have_introduction

    expect(cookies_page).to have_cookies_used_subheader

    expect(cookies_page.website_usage).to have_header
    cookies_page.website_usage.assert_content
    cookies_page.website_usage.assert_table

    expect(cookies_page.introductory_message).to have_header
    cookies_page.introductory_message.assert_content
    cookies_page.introductory_message.assert_table

    expect(cookies_page.store_answers).to have_header
    cookies_page.store_answers.assert_content
    cookies_page.store_answers.assert_table

    expect(cookies_page.more_secure).to have_header
    cookies_page.more_secure.assert_content

  end

  scenario "from your representative's details page" do
    your_representatives_details_page.load(locale: current_locale_parameter)

    your_representatives_details_page.cookies.click


    expect(cookies_page).to be_displayed
    expect(cookies_page).to have_header

    expect(cookies_page).to have_introduction

    expect(cookies_page).to have_cookies_used_subheader

    expect(cookies_page.website_usage).to have_header
    cookies_page.website_usage.assert_content
    cookies_page.website_usage.assert_table

    expect(cookies_page.introductory_message).to have_header
    cookies_page.introductory_message.assert_content
    cookies_page.introductory_message.assert_table

    expect(cookies_page.store_answers).to have_header
    cookies_page.store_answers.assert_content
    cookies_page.store_answers.assert_table

    expect(cookies_page.more_secure).to have_header
    cookies_page.more_secure.assert_content

  end

  scenario "from disability page" do
    disability_page.load(locale: current_locale_parameter)

    disability_page.cookies.click


    expect(cookies_page).to be_displayed
    expect(cookies_page).to have_header

    expect(cookies_page).to have_introduction

    expect(cookies_page).to have_cookies_used_subheader

    expect(cookies_page.website_usage).to have_header
    cookies_page.website_usage.assert_content
    cookies_page.website_usage.assert_table

    expect(cookies_page.introductory_message).to have_header
    cookies_page.introductory_message.assert_content
    cookies_page.introductory_message.assert_table

    expect(cookies_page.store_answers).to have_header
    cookies_page.store_answers.assert_content
    cookies_page.store_answers.assert_table

    expect(cookies_page.more_secure).to have_header
    cookies_page.more_secure.assert_content

  end

  scenario "from employer contract claim page" do
    employers_contract_claim_page.load(locale: current_locale_parameter)

    employers_contract_claim_page.cookies.click


    expect(cookies_page).to be_displayed
    expect(cookies_page).to have_header

    expect(cookies_page).to have_introduction

    expect(cookies_page).to have_cookies_used_subheader

    expect(cookies_page.website_usage).to have_header
    cookies_page.website_usage.assert_content
    cookies_page.website_usage.assert_table

    expect(cookies_page.introductory_message).to have_header
    cookies_page.introductory_message.assert_content
    cookies_page.introductory_message.assert_table

    expect(cookies_page.store_answers).to have_header
    cookies_page.store_answers.assert_content
    cookies_page.store_answers.assert_table

    expect(cookies_page.more_secure).to have_header
    cookies_page.more_secure.assert_content

  end

  scenario "from additional information page" do
    additional_information_page.load(locale: current_locale_parameter)

    additional_information_page.cookies.click


    expect(cookies_page).to be_displayed
    expect(cookies_page).to have_header

    expect(cookies_page).to have_introduction

    expect(cookies_page).to have_cookies_used_subheader

    expect(cookies_page.website_usage).to have_header
    cookies_page.website_usage.assert_content
    cookies_page.website_usage.assert_table

    expect(cookies_page.introductory_message).to have_header
    cookies_page.introductory_message.assert_content
    cookies_page.introductory_message.assert_table

    expect(cookies_page.store_answers).to have_header
    cookies_page.store_answers.assert_content
    cookies_page.store_answers.assert_table

    expect(cookies_page.more_secure).to have_header
    cookies_page.more_secure.assert_content

  end

  scenario "from confirmation of supplied details page" do
    confirmation_of_supplied_details_page.load(locale: current_locale_parameter)

    confirmation_of_supplied_details_page.cookies.click


    expect(cookies_page).to be_displayed
    expect(cookies_page).to have_header

    expect(cookies_page).to have_introduction

    expect(cookies_page).to have_cookies_used_subheader

    expect(cookies_page.website_usage).to have_header
    cookies_page.website_usage.assert_content
    cookies_page.website_usage.assert_table

    expect(cookies_page.introductory_message).to have_header
    cookies_page.introductory_message.assert_content
    cookies_page.introductory_message.assert_table

    expect(cookies_page.store_answers).to have_header
    cookies_page.store_answers.assert_content
    cookies_page.store_answers.assert_table

    expect(cookies_page.more_secure).to have_header
    cookies_page.more_secure.assert_content

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

    form_submission_page.cookies.click


    expect(cookies_page).to be_displayed
    expect(cookies_page).to have_header

    expect(cookies_page).to have_introduction

    expect(cookies_page).to have_cookies_used_subheader

    expect(cookies_page.website_usage).to have_header
    cookies_page.website_usage.assert_content
    cookies_page.website_usage.assert_table

    expect(cookies_page.introductory_message).to have_header
    cookies_page.introductory_message.assert_content
    cookies_page.introductory_message.assert_table

    expect(cookies_page.store_answers).to have_header
    cookies_page.store_answers.assert_content
    cookies_page.store_answers.assert_table

    expect(cookies_page.more_secure).to have_header
    cookies_page.more_secure.assert_content

  end

end

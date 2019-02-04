require 'rails_helper'

RSpec.feature "View Sidebar", js: true do
  include ET3::Test::I18n

  before do
    stub_et_api
    stub_presigned_url_api_for_s3
    stub_valid_office_code
  end

  scenario "on start page" do
    start_page.load(locale: current_locale_parameter)

    expect(start_page.sidebar).to have_link(t('components.sidebar.claim_link'), href: t('components.sidebar.claim_href'))
    expect(start_page.sidebar).to have_link(t('components.sidebar.response_link'), href: t('components.sidebar.response_href'))
    expect(start_page.sidebar).to have_link(t('components.sidebar.contact_link'), href: t('components.sidebar.contact_href'))
    expect(start_page.sidebar).to have_link(t('components.sidebar.download_link'), href: t('components.sidebar.download_href'))
    expect(start_page.sidebar).to have_link(t('components.sidebar.more_category_link'), href: t('components.sidebar.more_category_href'))
  end

  scenario "on respondent's details page" do
    respondents_details_page.load(locale: current_locale_parameter)

    expect(respondents_details_page.sidebar).to have_link(t('components.sidebar.claim_link'), href: t('components.sidebar.claim_href'))
    expect(respondents_details_page.sidebar).to have_link(t('components.sidebar.response_link'), href: t('components.sidebar.response_href'))
    expect(respondents_details_page.sidebar).to have_link(t('components.sidebar.contact_link'), href: t('components.sidebar.contact_href'))
    expect(respondents_details_page.sidebar).to have_link(t('components.sidebar.download_link'), href: t('components.sidebar.download_href'))
    expect(respondents_details_page.sidebar).to have_link(t('components.sidebar.more_category_link'), href: t('components.sidebar.more_category_href'))
  end

  scenario "on claimant's details page" do
    claimants_details_page.load(locale: current_locale_parameter)

    expect(claimants_details_page.sidebar).to have_link(t('components.sidebar.claim_link'), href: t('components.sidebar.claim_href'))
    expect(claimants_details_page.sidebar).to have_link(t('components.sidebar.response_link'), href: t('components.sidebar.response_href'))
    expect(claimants_details_page.sidebar).to have_link(t('components.sidebar.contact_link'), href: t('components.sidebar.contact_href'))
    expect(claimants_details_page.sidebar).to have_link(t('components.sidebar.download_link'), href: t('components.sidebar.download_href'))
    expect(claimants_details_page.sidebar).to have_link(t('components.sidebar.more_category_link'), href: t('components.sidebar.more_category_href'))
  end

  scenario "on earnings and benefits page" do
    earnings_and_benefits_page.load(locale: current_locale_parameter)

    expect(earnings_and_benefits_page.sidebar).to have_link(t('components.sidebar.claim_link'), href: t('components.sidebar.claim_href'))
    expect(earnings_and_benefits_page.sidebar).to have_link(t('components.sidebar.response_link'), href: t('components.sidebar.response_href'))
    expect(earnings_and_benefits_page.sidebar).to have_link(t('components.sidebar.contact_link'), href: t('components.sidebar.contact_href'))
    expect(earnings_and_benefits_page.sidebar).to have_link(t('components.sidebar.download_link'), href: t('components.sidebar.download_href'))
    expect(earnings_and_benefits_page.sidebar).to have_link(t('components.sidebar.more_category_link'), href: t('components.sidebar.more_category_href'))
  end

  scenario "response page" do
    response_page.load(locale: current_locale_parameter)

    expect(response_page.sidebar).to have_link(t('components.sidebar.claim_link'), href: t('components.sidebar.claim_href'))
    expect(response_page.sidebar).to have_link(t('components.sidebar.response_link'), href: t('components.sidebar.response_href'))
    expect(response_page.sidebar).to have_link(t('components.sidebar.contact_link'), href: t('components.sidebar.contact_href'))
    expect(response_page.sidebar).to have_link(t('components.sidebar.download_link'), href: t('components.sidebar.download_href'))
    expect(response_page.sidebar).to have_link(t('components.sidebar.more_category_link'), href: t('components.sidebar.more_category_href'))
  end

  scenario "your representative page" do
    your_representative_page.load(locale: current_locale_parameter)

    expect(your_representative_page.sidebar).to have_link(t('components.sidebar.claim_link'), href: t('components.sidebar.claim_href'))
    expect(your_representative_page.sidebar).to have_link(t('components.sidebar.response_link'), href: t('components.sidebar.response_href'))
    expect(your_representative_page.sidebar).to have_link(t('components.sidebar.contact_link'), href: t('components.sidebar.contact_href'))
    expect(your_representative_page.sidebar).to have_link(t('components.sidebar.download_link'), href: t('components.sidebar.download_href'))
    expect(your_representative_page.sidebar).to have_link(t('components.sidebar.more_category_link'), href: t('components.sidebar.more_category_href'))
  end

  scenario "your representative's details page" do
    your_representatives_details_page.load(locale: current_locale_parameter)

    expect(your_representatives_details_page.sidebar).to have_link(t('components.sidebar.claim_link'), href: t('components.sidebar.claim_href'))
    expect(your_representatives_details_page.sidebar).to have_link(t('components.sidebar.response_link'), href: t('components.sidebar.response_href'))
    expect(your_representatives_details_page.sidebar).to have_link(t('components.sidebar.contact_link'), href: t('components.sidebar.contact_href'))
    expect(your_representatives_details_page.sidebar).to have_link(t('components.sidebar.download_link'), href: t('components.sidebar.download_href'))
    expect(your_representatives_details_page.sidebar).to have_link(t('components.sidebar.more_category_link'), href: t('components.sidebar.more_category_href'))
  end

  scenario "disability page" do
    disability_page.load(locale: current_locale_parameter)

    expect(disability_page.sidebar).to have_link(t('components.sidebar.claim_link'), href: t('components.sidebar.claim_href'))
    expect(disability_page.sidebar).to have_link(t('components.sidebar.response_link'), href: t('components.sidebar.response_href'))
    expect(disability_page.sidebar).to have_link(t('components.sidebar.contact_link'), href: t('components.sidebar.contact_href'))
    expect(disability_page.sidebar).to have_link(t('components.sidebar.download_link'), href: t('components.sidebar.download_href'))
    expect(disability_page.sidebar).to have_link(t('components.sidebar.more_category_link'), href: t('components.sidebar.more_category_href'))
  end

  scenario "employer contract claim page" do
    employers_contract_claim_page.load(locale: current_locale_parameter)

    expect(employers_contract_claim_page.sidebar).to have_link(t('components.sidebar.claim_link'), href: t('components.sidebar.claim_href'))
    expect(employers_contract_claim_page.sidebar).to have_link(t('components.sidebar.response_link'), href: t('components.sidebar.response_href'))
    expect(employers_contract_claim_page.sidebar).to have_link(t('components.sidebar.contact_link'), href: t('components.sidebar.contact_href'))
    expect(employers_contract_claim_page.sidebar).to have_link(t('components.sidebar.download_link'), href: t('components.sidebar.download_href'))
    expect(employers_contract_claim_page.sidebar).to have_link(t('components.sidebar.more_category_link'), href: t('components.sidebar.more_category_href'))
  end

  scenario "additional information page" do
    additional_information_page.load(locale: current_locale_parameter)

    expect(additional_information_page.sidebar).to have_link(t('components.sidebar.claim_link'), href: t('components.sidebar.claim_href'))
    expect(additional_information_page.sidebar).to have_link(t('components.sidebar.response_link'), href: t('components.sidebar.response_href'))
    expect(additional_information_page.sidebar).to have_link(t('components.sidebar.contact_link'), href: t('components.sidebar.contact_href'))
    expect(additional_information_page.sidebar).to have_link(t('components.sidebar.download_link'), href: t('components.sidebar.download_href'))
    expect(additional_information_page.sidebar).to have_link(t('components.sidebar.more_category_link'), href: t('components.sidebar.more_category_href'))
  end

  scenario "confirmation of supplied details page" do
    confirmation_of_supplied_details_page.load(locale: current_locale_parameter)

    expect(confirmation_of_supplied_details_page.sidebar).to have_link(t('components.sidebar.claim_link'), href: t('components.sidebar.claim_href'))
    expect(confirmation_of_supplied_details_page.sidebar).to have_link(t('components.sidebar.response_link'), href: t('components.sidebar.response_href'))
    expect(confirmation_of_supplied_details_page.sidebar).to have_link(t('components.sidebar.contact_link'), href: t('components.sidebar.contact_href'))
    expect(confirmation_of_supplied_details_page.sidebar).to have_link(t('components.sidebar.download_link'), href: t('components.sidebar.download_href'))
    expect(confirmation_of_supplied_details_page.sidebar).to have_link(t('components.sidebar.more_category_link'), href: t('components.sidebar.more_category_href'))
  end

  scenario "form submission page" do
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

    expect(form_submission_page.sidebar).to have_link(t('components.sidebar.claim_link'), href: t('components.sidebar.claim_href'))
    expect(form_submission_page.sidebar).to have_link(t('components.sidebar.response_link'), href: t('components.sidebar.response_href'))
    expect(form_submission_page.sidebar).to have_link(t('components.sidebar.contact_link'), href: t('components.sidebar.contact_href'))
    expect(form_submission_page.sidebar).to have_link(t('components.sidebar.download_link'), href: t('components.sidebar.download_href'))
    expect(form_submission_page.sidebar).to have_link(t('components.sidebar.more_category_link'), href: t('components.sidebar.more_category_href'))
  end

end

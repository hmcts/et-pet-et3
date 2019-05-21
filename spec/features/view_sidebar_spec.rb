require 'rails_helper'

RSpec.feature "View Sidebar", js: true do
  include ET3::Test::I18n

  before do
    stub_et_api
    stub_build_blob_to_azure
  end

  shared_examples "on a per-page basis" do
    scenario "will show links" do
      current_page.load(locale: current_locale_parameter)

      expect(current_page.sidebar).to have_link(t('components.sidebar.claim_link'), href: t('components.sidebar.claim_href'))
      expect(current_page.sidebar).to have_link(t('components.sidebar.response_link'), href: t('components.sidebar.response_href'))
      expect(current_page.sidebar).to have_link(t('components.sidebar.download_link'), href: t('components.sidebar.download_href'))
      expect(current_page.sidebar).to have_link(t('components.sidebar.more_category_link'), href: t('components.sidebar.more_category_href'))
    end
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
    expect(form_submission_page.sidebar).to have_link(t('components.sidebar.download_link'), href: t('components.sidebar.download_href'))
    expect(form_submission_page.sidebar).to have_link(t('components.sidebar.more_category_link'), href: t('components.sidebar.more_category_href'))
  end

  context "when originally on the start page" do
    let(:current_page) { ET3::Test::StartPage.new }

    include_examples "on a per-page basis"
  end

  context "when originally on the respondent's details page" do
    let(:current_page) { ET3::Test::RespondentsDetailsPage.new }

    include_examples "on a per-page basis"
  end

  context "when originally on the claimant's details page" do
    let(:current_page) { ET3::Test::ClaimantsDetailsPage.new }

    include_examples "on a per-page basis"
  end

  context "when originally on the earnings and benefits page" do
    let(:current_page) { ET3::Test::EarningsAndBenefitsPage.new }

    include_examples "on a per-page basis"
  end

  context "when originally on the response page" do
    let(:current_page) { ET3::Test::ResponsePage.new }

    include_examples "on a per-page basis"
  end

  context "when originally on the your representative page" do
    let(:current_page) { ET3::Test::ResponsePage.new }

    include_examples "on a per-page basis"
  end

  context "when originally on the your representative's details page" do
    let(:current_page) { ET3::Test::ResponsePage.new }

    include_examples "on a per-page basis"
  end

  context "when originally on the disability page" do
    let(:current_page) { ET3::Test::DisabilityPage.new }

    include_examples "on a per-page basis"
  end

  context "when originally on the employer contract claim page" do
    let(:current_page) { ET3::Test::EmployersContractClaimPage.new }

    include_examples "on a per-page basis"
  end

  context "when originally on the additional information page" do
    let(:current_page) { ET3::Test::AdditionalInformationPage.new }

    include_examples "on a per-page basis"
  end

  context "when originally on the confirmation of supplied details page" do
    let(:current_page) { ET3::Test::ConfirmationOfSuppliedDetailsPage.new }

    include_examples "on a per-page basis"
  end

end

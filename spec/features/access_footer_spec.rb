require 'rails_helper'

RSpec.feature "Access Footer", js: true do
  include ET3::Test::I18n

  before do
    stub_et_api
    stub_presigned_url_api_for_s3
  end

  scenario "from start page" do
    start_page.load(locale: current_locale_parameter)

    start_page.terms.click

    expect(terms_and_conditions_page).to be_displayed

    expect(terms_and_conditions_page).to have_general_terms_link
    expect(terms_and_conditions_page).to have_applicable_law_link
    expect(terms_and_conditions_page).to have_responsible_use_link
    expect(terms_and_conditions_page).to have_gdpr_link
    expect(terms_and_conditions_page).to have_hmcts_notice_link
    expect(terms_and_conditions_page).to have_disclaimer_link

    expect(terms_and_conditions_page).to have_introduction

    expect(terms_and_conditions_page.general_terms).to have_header
    terms_and_conditions_page.general_terms.assert_content

    expect(terms_and_conditions_page.applicable_law).to have_header
    terms_and_conditions_page.applicable_law.assert_content

    expect(terms_and_conditions_page.responsible_use).to have_header
    terms_and_conditions_page.responsible_use.assert_content

    expect(terms_and_conditions_page.gdpr).to have_header
    terms_and_conditions_page.gdpr.assert_content

    expect(terms_and_conditions_page.hmcts_notice).to have_header

    expect(terms_and_conditions_page.hmcts_notice).to have_purpose_header
    terms_and_conditions_page.hmcts_notice.assert_purpose_content

    expect(terms_and_conditions_page.hmcts_notice).to have_about_personal_data_header
    terms_and_conditions_page.hmcts_notice.assert_about_personal_data_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_collect_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_collect_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_use_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_use_content

    expect(terms_and_conditions_page.hmcts_notice).to have_non_personal_use_header
    terms_and_conditions_page.hmcts_notice.assert_non_personal_use_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_stored_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_stored_content

    expect(terms_and_conditions_page.hmcts_notice).to have_non_personal_data_stored_header
    terms_and_conditions_page.hmcts_notice.assert_non_personal_data_stored_content

    expect(terms_and_conditions_page.hmcts_notice).to have_data_secure_header
    terms_and_conditions_page.hmcts_notice.assert_data_secure_content

    expect(terms_and_conditions_page.hmcts_notice).to have_disclosing_data_header
    terms_and_conditions_page.hmcts_notice.assert_disclosing_data_content

    expect(terms_and_conditions_page.hmcts_notice).to have_manage_sessions_header
    terms_and_conditions_page.hmcts_notice.assert_manage_sessions_content

    expect(terms_and_conditions_page.hmcts_notice).to have_access_personal_info_header
    terms_and_conditions_page.hmcts_notice.assert_access_personal_info_content

    expect(terms_and_conditions_page.hmcts_notice).to have_more_details_header
    terms_and_conditions_page.hmcts_notice.assert_more_details_content

    expect(terms_and_conditions_page.hmcts_notice).to have_make_complaint_header
    terms_and_conditions_page.hmcts_notice.assert_make_complaint_content

    expect(terms_and_conditions_page.hmcts_notice).to have_complaints_header
    terms_and_conditions_page.hmcts_notice.assert_complaints_content

    expect(terms_and_conditions_page.disclaimer).to have_header
    terms_and_conditions_page.disclaimer.assert_content
  end

  scenario "from respondent's details page" do
    respondents_details_page.load(locale: current_locale_parameter)

    respondents_details_page.terms.click

    expect(terms_and_conditions_page).to be_displayed

    expect(terms_and_conditions_page).to have_general_terms_link
    expect(terms_and_conditions_page).to have_applicable_law_link
    expect(terms_and_conditions_page).to have_responsible_use_link
    expect(terms_and_conditions_page).to have_gdpr_link
    expect(terms_and_conditions_page).to have_hmcts_notice_link
    expect(terms_and_conditions_page).to have_disclaimer_link

    expect(terms_and_conditions_page).to have_introduction

    expect(terms_and_conditions_page.general_terms).to have_header
    terms_and_conditions_page.general_terms.assert_content

    expect(terms_and_conditions_page.applicable_law).to have_header
    terms_and_conditions_page.applicable_law.assert_content

    expect(terms_and_conditions_page.responsible_use).to have_header
    terms_and_conditions_page.responsible_use.assert_content

    expect(terms_and_conditions_page.gdpr).to have_header
    terms_and_conditions_page.gdpr.assert_content

    expect(terms_and_conditions_page.hmcts_notice).to have_header

    expect(terms_and_conditions_page.hmcts_notice).to have_purpose_header
    terms_and_conditions_page.hmcts_notice.assert_purpose_content

    expect(terms_and_conditions_page.hmcts_notice).to have_about_personal_data_header
    terms_and_conditions_page.hmcts_notice.assert_about_personal_data_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_collect_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_collect_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_use_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_use_content

    expect(terms_and_conditions_page.hmcts_notice).to have_non_personal_use_header
    terms_and_conditions_page.hmcts_notice.assert_non_personal_use_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_stored_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_stored_content

    expect(terms_and_conditions_page.hmcts_notice).to have_non_personal_data_stored_header
    terms_and_conditions_page.hmcts_notice.assert_non_personal_data_stored_content

    expect(terms_and_conditions_page.hmcts_notice).to have_data_secure_header
    terms_and_conditions_page.hmcts_notice.assert_data_secure_content

    expect(terms_and_conditions_page.hmcts_notice).to have_disclosing_data_header
    terms_and_conditions_page.hmcts_notice.assert_disclosing_data_content

    expect(terms_and_conditions_page.hmcts_notice).to have_manage_sessions_header
    terms_and_conditions_page.hmcts_notice.assert_manage_sessions_content

    expect(terms_and_conditions_page.hmcts_notice).to have_access_personal_info_header
    terms_and_conditions_page.hmcts_notice.assert_access_personal_info_content

    expect(terms_and_conditions_page.hmcts_notice).to have_more_details_header
    terms_and_conditions_page.hmcts_notice.assert_more_details_content

    expect(terms_and_conditions_page.hmcts_notice).to have_make_complaint_header
    terms_and_conditions_page.hmcts_notice.assert_make_complaint_content

    expect(terms_and_conditions_page.hmcts_notice).to have_complaints_header
    terms_and_conditions_page.hmcts_notice.assert_complaints_content

    expect(terms_and_conditions_page.disclaimer).to have_header
    terms_and_conditions_page.disclaimer.assert_content
  end

  scenario "from claimant's details page" do
    claimants_details_page.load(locale: current_locale_parameter)

    claimants_details_page.terms.click

    expect(terms_and_conditions_page).to be_displayed

    expect(terms_and_conditions_page).to have_general_terms_link
    expect(terms_and_conditions_page).to have_applicable_law_link
    expect(terms_and_conditions_page).to have_responsible_use_link
    expect(terms_and_conditions_page).to have_gdpr_link
    expect(terms_and_conditions_page).to have_hmcts_notice_link
    expect(terms_and_conditions_page).to have_disclaimer_link

    expect(terms_and_conditions_page).to have_introduction

    expect(terms_and_conditions_page.general_terms).to have_header
    terms_and_conditions_page.general_terms.assert_content

    expect(terms_and_conditions_page.applicable_law).to have_header
    terms_and_conditions_page.applicable_law.assert_content

    expect(terms_and_conditions_page.responsible_use).to have_header
    terms_and_conditions_page.responsible_use.assert_content

    expect(terms_and_conditions_page.gdpr).to have_header
    terms_and_conditions_page.gdpr.assert_content

    expect(terms_and_conditions_page.hmcts_notice).to have_header

    expect(terms_and_conditions_page.hmcts_notice).to have_purpose_header
    terms_and_conditions_page.hmcts_notice.assert_purpose_content

    expect(terms_and_conditions_page.hmcts_notice).to have_about_personal_data_header
    terms_and_conditions_page.hmcts_notice.assert_about_personal_data_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_collect_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_collect_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_use_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_use_content

    expect(terms_and_conditions_page.hmcts_notice).to have_non_personal_use_header
    terms_and_conditions_page.hmcts_notice.assert_non_personal_use_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_stored_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_stored_content

    expect(terms_and_conditions_page.hmcts_notice).to have_non_personal_data_stored_header
    terms_and_conditions_page.hmcts_notice.assert_non_personal_data_stored_content

    expect(terms_and_conditions_page.hmcts_notice).to have_data_secure_header
    terms_and_conditions_page.hmcts_notice.assert_data_secure_content

    expect(terms_and_conditions_page.hmcts_notice).to have_disclosing_data_header
    terms_and_conditions_page.hmcts_notice.assert_disclosing_data_content

    expect(terms_and_conditions_page.hmcts_notice).to have_manage_sessions_header
    terms_and_conditions_page.hmcts_notice.assert_manage_sessions_content

    expect(terms_and_conditions_page.hmcts_notice).to have_access_personal_info_header
    terms_and_conditions_page.hmcts_notice.assert_access_personal_info_content

    expect(terms_and_conditions_page.hmcts_notice).to have_more_details_header
    terms_and_conditions_page.hmcts_notice.assert_more_details_content

    expect(terms_and_conditions_page.hmcts_notice).to have_make_complaint_header
    terms_and_conditions_page.hmcts_notice.assert_make_complaint_content

    expect(terms_and_conditions_page.hmcts_notice).to have_complaints_header
    terms_and_conditions_page.hmcts_notice.assert_complaints_content

    expect(terms_and_conditions_page.disclaimer).to have_header
    terms_and_conditions_page.disclaimer.assert_content
  end

  scenario "from earnings and benefits page" do
    earnings_and_benefits_page.load(locale: current_locale_parameter)

    earnings_and_benefits_page.terms.click

    expect(terms_and_conditions_page).to be_displayed

    expect(terms_and_conditions_page).to have_general_terms_link
    expect(terms_and_conditions_page).to have_applicable_law_link
    expect(terms_and_conditions_page).to have_responsible_use_link
    expect(terms_and_conditions_page).to have_gdpr_link
    expect(terms_and_conditions_page).to have_hmcts_notice_link
    expect(terms_and_conditions_page).to have_disclaimer_link

    expect(terms_and_conditions_page).to have_introduction

    expect(terms_and_conditions_page.general_terms).to have_header
    terms_and_conditions_page.general_terms.assert_content

    expect(terms_and_conditions_page.applicable_law).to have_header
    terms_and_conditions_page.applicable_law.assert_content

    expect(terms_and_conditions_page.responsible_use).to have_header
    terms_and_conditions_page.responsible_use.assert_content

    expect(terms_and_conditions_page.gdpr).to have_header
    terms_and_conditions_page.gdpr.assert_content

    expect(terms_and_conditions_page.hmcts_notice).to have_header

    expect(terms_and_conditions_page.hmcts_notice).to have_purpose_header
    terms_and_conditions_page.hmcts_notice.assert_purpose_content

    expect(terms_and_conditions_page.hmcts_notice).to have_about_personal_data_header
    terms_and_conditions_page.hmcts_notice.assert_about_personal_data_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_collect_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_collect_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_use_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_use_content

    expect(terms_and_conditions_page.hmcts_notice).to have_non_personal_use_header
    terms_and_conditions_page.hmcts_notice.assert_non_personal_use_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_stored_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_stored_content

    expect(terms_and_conditions_page.hmcts_notice).to have_non_personal_data_stored_header
    terms_and_conditions_page.hmcts_notice.assert_non_personal_data_stored_content

    expect(terms_and_conditions_page.hmcts_notice).to have_data_secure_header
    terms_and_conditions_page.hmcts_notice.assert_data_secure_content

    expect(terms_and_conditions_page.hmcts_notice).to have_disclosing_data_header
    terms_and_conditions_page.hmcts_notice.assert_disclosing_data_content

    expect(terms_and_conditions_page.hmcts_notice).to have_manage_sessions_header
    terms_and_conditions_page.hmcts_notice.assert_manage_sessions_content

    expect(terms_and_conditions_page.hmcts_notice).to have_access_personal_info_header
    terms_and_conditions_page.hmcts_notice.assert_access_personal_info_content

    expect(terms_and_conditions_page.hmcts_notice).to have_more_details_header
    terms_and_conditions_page.hmcts_notice.assert_more_details_content

    expect(terms_and_conditions_page.hmcts_notice).to have_make_complaint_header
    terms_and_conditions_page.hmcts_notice.assert_make_complaint_content

    expect(terms_and_conditions_page.hmcts_notice).to have_complaints_header
    terms_and_conditions_page.hmcts_notice.assert_complaints_content

    expect(terms_and_conditions_page.disclaimer).to have_header
    terms_and_conditions_page.disclaimer.assert_content
  end

  scenario "from response page" do
    response_page.load(locale: current_locale_parameter)

    response_page.terms.click

    expect(terms_and_conditions_page).to be_displayed

    expect(terms_and_conditions_page).to have_general_terms_link
    expect(terms_and_conditions_page).to have_applicable_law_link
    expect(terms_and_conditions_page).to have_responsible_use_link
    expect(terms_and_conditions_page).to have_gdpr_link
    expect(terms_and_conditions_page).to have_hmcts_notice_link
    expect(terms_and_conditions_page).to have_disclaimer_link

    expect(terms_and_conditions_page).to have_introduction

    expect(terms_and_conditions_page.general_terms).to have_header
    terms_and_conditions_page.general_terms.assert_content

    expect(terms_and_conditions_page.applicable_law).to have_header
    terms_and_conditions_page.applicable_law.assert_content

    expect(terms_and_conditions_page.responsible_use).to have_header
    terms_and_conditions_page.responsible_use.assert_content

    expect(terms_and_conditions_page.gdpr).to have_header
    terms_and_conditions_page.gdpr.assert_content

    expect(terms_and_conditions_page.hmcts_notice).to have_header

    expect(terms_and_conditions_page.hmcts_notice).to have_purpose_header
    terms_and_conditions_page.hmcts_notice.assert_purpose_content

    expect(terms_and_conditions_page.hmcts_notice).to have_about_personal_data_header
    terms_and_conditions_page.hmcts_notice.assert_about_personal_data_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_collect_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_collect_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_use_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_use_content

    expect(terms_and_conditions_page.hmcts_notice).to have_non_personal_use_header
    terms_and_conditions_page.hmcts_notice.assert_non_personal_use_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_stored_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_stored_content

    expect(terms_and_conditions_page.hmcts_notice).to have_non_personal_data_stored_header
    terms_and_conditions_page.hmcts_notice.assert_non_personal_data_stored_content

    expect(terms_and_conditions_page.hmcts_notice).to have_data_secure_header
    terms_and_conditions_page.hmcts_notice.assert_data_secure_content

    expect(terms_and_conditions_page.hmcts_notice).to have_disclosing_data_header
    terms_and_conditions_page.hmcts_notice.assert_disclosing_data_content

    expect(terms_and_conditions_page.hmcts_notice).to have_manage_sessions_header
    terms_and_conditions_page.hmcts_notice.assert_manage_sessions_content

    expect(terms_and_conditions_page.hmcts_notice).to have_access_personal_info_header
    terms_and_conditions_page.hmcts_notice.assert_access_personal_info_content

    expect(terms_and_conditions_page.hmcts_notice).to have_more_details_header
    terms_and_conditions_page.hmcts_notice.assert_more_details_content

    expect(terms_and_conditions_page.hmcts_notice).to have_make_complaint_header
    terms_and_conditions_page.hmcts_notice.assert_make_complaint_content

    expect(terms_and_conditions_page.hmcts_notice).to have_complaints_header
    terms_and_conditions_page.hmcts_notice.assert_complaints_content

    expect(terms_and_conditions_page.disclaimer).to have_header
    terms_and_conditions_page.disclaimer.assert_content
  end

  scenario "from your representative page" do
    your_representative_page.load(locale: current_locale_parameter)

    your_representative_page.terms.click

    expect(terms_and_conditions_page).to be_displayed

    expect(terms_and_conditions_page).to have_general_terms_link
    expect(terms_and_conditions_page).to have_applicable_law_link
    expect(terms_and_conditions_page).to have_responsible_use_link
    expect(terms_and_conditions_page).to have_gdpr_link
    expect(terms_and_conditions_page).to have_hmcts_notice_link
    expect(terms_and_conditions_page).to have_disclaimer_link

    expect(terms_and_conditions_page).to have_introduction

    expect(terms_and_conditions_page.general_terms).to have_header
    terms_and_conditions_page.general_terms.assert_content

    expect(terms_and_conditions_page.applicable_law).to have_header
    terms_and_conditions_page.applicable_law.assert_content

    expect(terms_and_conditions_page.responsible_use).to have_header
    terms_and_conditions_page.responsible_use.assert_content

    expect(terms_and_conditions_page.gdpr).to have_header
    terms_and_conditions_page.gdpr.assert_content

    expect(terms_and_conditions_page.hmcts_notice).to have_header

    expect(terms_and_conditions_page.hmcts_notice).to have_purpose_header
    terms_and_conditions_page.hmcts_notice.assert_purpose_content

    expect(terms_and_conditions_page.hmcts_notice).to have_about_personal_data_header
    terms_and_conditions_page.hmcts_notice.assert_about_personal_data_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_collect_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_collect_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_use_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_use_content

    expect(terms_and_conditions_page.hmcts_notice).to have_non_personal_use_header
    terms_and_conditions_page.hmcts_notice.assert_non_personal_use_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_stored_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_stored_content

    expect(terms_and_conditions_page.hmcts_notice).to have_non_personal_data_stored_header
    terms_and_conditions_page.hmcts_notice.assert_non_personal_data_stored_content

    expect(terms_and_conditions_page.hmcts_notice).to have_data_secure_header
    terms_and_conditions_page.hmcts_notice.assert_data_secure_content

    expect(terms_and_conditions_page.hmcts_notice).to have_disclosing_data_header
    terms_and_conditions_page.hmcts_notice.assert_disclosing_data_content

    expect(terms_and_conditions_page.hmcts_notice).to have_manage_sessions_header
    terms_and_conditions_page.hmcts_notice.assert_manage_sessions_content

    expect(terms_and_conditions_page.hmcts_notice).to have_access_personal_info_header
    terms_and_conditions_page.hmcts_notice.assert_access_personal_info_content

    expect(terms_and_conditions_page.hmcts_notice).to have_more_details_header
    terms_and_conditions_page.hmcts_notice.assert_more_details_content

    expect(terms_and_conditions_page.hmcts_notice).to have_make_complaint_header
    terms_and_conditions_page.hmcts_notice.assert_make_complaint_content

    expect(terms_and_conditions_page.hmcts_notice).to have_complaints_header
    terms_and_conditions_page.hmcts_notice.assert_complaints_content

    expect(terms_and_conditions_page.disclaimer).to have_header
    terms_and_conditions_page.disclaimer.assert_content
  end

  scenario "from your representative's details page" do
    your_representatives_details_page.load(locale: current_locale_parameter)

    your_representatives_details_page.terms.click

    expect(terms_and_conditions_page).to be_displayed

    expect(terms_and_conditions_page).to have_general_terms_link
    expect(terms_and_conditions_page).to have_applicable_law_link
    expect(terms_and_conditions_page).to have_responsible_use_link
    expect(terms_and_conditions_page).to have_gdpr_link
    expect(terms_and_conditions_page).to have_hmcts_notice_link
    expect(terms_and_conditions_page).to have_disclaimer_link

    expect(terms_and_conditions_page).to have_introduction

    expect(terms_and_conditions_page.general_terms).to have_header
    terms_and_conditions_page.general_terms.assert_content

    expect(terms_and_conditions_page.applicable_law).to have_header
    terms_and_conditions_page.applicable_law.assert_content

    expect(terms_and_conditions_page.responsible_use).to have_header
    terms_and_conditions_page.responsible_use.assert_content

    expect(terms_and_conditions_page.gdpr).to have_header
    terms_and_conditions_page.gdpr.assert_content

    expect(terms_and_conditions_page.hmcts_notice).to have_header

    expect(terms_and_conditions_page.hmcts_notice).to have_purpose_header
    terms_and_conditions_page.hmcts_notice.assert_purpose_content

    expect(terms_and_conditions_page.hmcts_notice).to have_about_personal_data_header
    terms_and_conditions_page.hmcts_notice.assert_about_personal_data_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_collect_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_collect_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_use_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_use_content

    expect(terms_and_conditions_page.hmcts_notice).to have_non_personal_use_header
    terms_and_conditions_page.hmcts_notice.assert_non_personal_use_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_stored_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_stored_content

    expect(terms_and_conditions_page.hmcts_notice).to have_non_personal_data_stored_header
    terms_and_conditions_page.hmcts_notice.assert_non_personal_data_stored_content

    expect(terms_and_conditions_page.hmcts_notice).to have_data_secure_header
    terms_and_conditions_page.hmcts_notice.assert_data_secure_content

    expect(terms_and_conditions_page.hmcts_notice).to have_disclosing_data_header
    terms_and_conditions_page.hmcts_notice.assert_disclosing_data_content

    expect(terms_and_conditions_page.hmcts_notice).to have_manage_sessions_header
    terms_and_conditions_page.hmcts_notice.assert_manage_sessions_content

    expect(terms_and_conditions_page.hmcts_notice).to have_access_personal_info_header
    terms_and_conditions_page.hmcts_notice.assert_access_personal_info_content

    expect(terms_and_conditions_page.hmcts_notice).to have_more_details_header
    terms_and_conditions_page.hmcts_notice.assert_more_details_content

    expect(terms_and_conditions_page.hmcts_notice).to have_make_complaint_header
    terms_and_conditions_page.hmcts_notice.assert_make_complaint_content

    expect(terms_and_conditions_page.hmcts_notice).to have_complaints_header
    terms_and_conditions_page.hmcts_notice.assert_complaints_content

    expect(terms_and_conditions_page.disclaimer).to have_header
    terms_and_conditions_page.disclaimer.assert_content
  end

  scenario "from disability page" do
    disability_page.load(locale: current_locale_parameter)

    disability_page.terms.click

    expect(terms_and_conditions_page).to be_displayed

    expect(terms_and_conditions_page).to have_general_terms_link
    expect(terms_and_conditions_page).to have_applicable_law_link
    expect(terms_and_conditions_page).to have_responsible_use_link
    expect(terms_and_conditions_page).to have_gdpr_link
    expect(terms_and_conditions_page).to have_hmcts_notice_link
    expect(terms_and_conditions_page).to have_disclaimer_link

    expect(terms_and_conditions_page).to have_introduction

    expect(terms_and_conditions_page.general_terms).to have_header
    terms_and_conditions_page.general_terms.assert_content

    expect(terms_and_conditions_page.applicable_law).to have_header
    terms_and_conditions_page.applicable_law.assert_content

    expect(terms_and_conditions_page.responsible_use).to have_header
    terms_and_conditions_page.responsible_use.assert_content

    expect(terms_and_conditions_page.gdpr).to have_header
    terms_and_conditions_page.gdpr.assert_content

    expect(terms_and_conditions_page.hmcts_notice).to have_header

    expect(terms_and_conditions_page.hmcts_notice).to have_purpose_header
    terms_and_conditions_page.hmcts_notice.assert_purpose_content

    expect(terms_and_conditions_page.hmcts_notice).to have_about_personal_data_header
    terms_and_conditions_page.hmcts_notice.assert_about_personal_data_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_collect_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_collect_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_use_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_use_content

    expect(terms_and_conditions_page.hmcts_notice).to have_non_personal_use_header
    terms_and_conditions_page.hmcts_notice.assert_non_personal_use_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_stored_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_stored_content

    expect(terms_and_conditions_page.hmcts_notice).to have_non_personal_data_stored_header
    terms_and_conditions_page.hmcts_notice.assert_non_personal_data_stored_content

    expect(terms_and_conditions_page.hmcts_notice).to have_data_secure_header
    terms_and_conditions_page.hmcts_notice.assert_data_secure_content

    expect(terms_and_conditions_page.hmcts_notice).to have_disclosing_data_header
    terms_and_conditions_page.hmcts_notice.assert_disclosing_data_content

    expect(terms_and_conditions_page.hmcts_notice).to have_manage_sessions_header
    terms_and_conditions_page.hmcts_notice.assert_manage_sessions_content

    expect(terms_and_conditions_page.hmcts_notice).to have_access_personal_info_header
    terms_and_conditions_page.hmcts_notice.assert_access_personal_info_content

    expect(terms_and_conditions_page.hmcts_notice).to have_more_details_header
    terms_and_conditions_page.hmcts_notice.assert_more_details_content

    expect(terms_and_conditions_page.hmcts_notice).to have_make_complaint_header
    terms_and_conditions_page.hmcts_notice.assert_make_complaint_content

    expect(terms_and_conditions_page.hmcts_notice).to have_complaints_header
    terms_and_conditions_page.hmcts_notice.assert_complaints_content

    expect(terms_and_conditions_page.disclaimer).to have_header
    terms_and_conditions_page.disclaimer.assert_content
  end

  scenario "from employer contract claim page" do
    employers_contract_claim_page.load(locale: current_locale_parameter)

    employers_contract_claim_page.terms.click

    expect(terms_and_conditions_page).to be_displayed

    expect(terms_and_conditions_page).to have_general_terms_link
    expect(terms_and_conditions_page).to have_applicable_law_link
    expect(terms_and_conditions_page).to have_responsible_use_link
    expect(terms_and_conditions_page).to have_gdpr_link
    expect(terms_and_conditions_page).to have_hmcts_notice_link
    expect(terms_and_conditions_page).to have_disclaimer_link

    expect(terms_and_conditions_page).to have_introduction

    expect(terms_and_conditions_page.general_terms).to have_header
    terms_and_conditions_page.general_terms.assert_content

    expect(terms_and_conditions_page.applicable_law).to have_header
    terms_and_conditions_page.applicable_law.assert_content

    expect(terms_and_conditions_page.responsible_use).to have_header
    terms_and_conditions_page.responsible_use.assert_content

    expect(terms_and_conditions_page.gdpr).to have_header
    terms_and_conditions_page.gdpr.assert_content

    expect(terms_and_conditions_page.hmcts_notice).to have_header

    expect(terms_and_conditions_page.hmcts_notice).to have_purpose_header
    terms_and_conditions_page.hmcts_notice.assert_purpose_content

    expect(terms_and_conditions_page.hmcts_notice).to have_about_personal_data_header
    terms_and_conditions_page.hmcts_notice.assert_about_personal_data_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_collect_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_collect_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_use_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_use_content

    expect(terms_and_conditions_page.hmcts_notice).to have_non_personal_use_header
    terms_and_conditions_page.hmcts_notice.assert_non_personal_use_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_stored_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_stored_content

    expect(terms_and_conditions_page.hmcts_notice).to have_non_personal_data_stored_header
    terms_and_conditions_page.hmcts_notice.assert_non_personal_data_stored_content

    expect(terms_and_conditions_page.hmcts_notice).to have_data_secure_header
    terms_and_conditions_page.hmcts_notice.assert_data_secure_content

    expect(terms_and_conditions_page.hmcts_notice).to have_disclosing_data_header
    terms_and_conditions_page.hmcts_notice.assert_disclosing_data_content

    expect(terms_and_conditions_page.hmcts_notice).to have_manage_sessions_header
    terms_and_conditions_page.hmcts_notice.assert_manage_sessions_content

    expect(terms_and_conditions_page.hmcts_notice).to have_access_personal_info_header
    terms_and_conditions_page.hmcts_notice.assert_access_personal_info_content

    expect(terms_and_conditions_page.hmcts_notice).to have_more_details_header
    terms_and_conditions_page.hmcts_notice.assert_more_details_content

    expect(terms_and_conditions_page.hmcts_notice).to have_make_complaint_header
    terms_and_conditions_page.hmcts_notice.assert_make_complaint_content

    expect(terms_and_conditions_page.hmcts_notice).to have_complaints_header
    terms_and_conditions_page.hmcts_notice.assert_complaints_content

    expect(terms_and_conditions_page.disclaimer).to have_header
    terms_and_conditions_page.disclaimer.assert_content
  end

  scenario "from additional information page" do
    additional_information_page.load(locale: current_locale_parameter)

    additional_information_page.terms.click

    expect(terms_and_conditions_page).to be_displayed

    expect(terms_and_conditions_page).to have_general_terms_link
    expect(terms_and_conditions_page).to have_applicable_law_link
    expect(terms_and_conditions_page).to have_responsible_use_link
    expect(terms_and_conditions_page).to have_gdpr_link
    expect(terms_and_conditions_page).to have_hmcts_notice_link
    expect(terms_and_conditions_page).to have_disclaimer_link

    expect(terms_and_conditions_page).to have_introduction

    expect(terms_and_conditions_page.general_terms).to have_header
    terms_and_conditions_page.general_terms.assert_content

    expect(terms_and_conditions_page.applicable_law).to have_header
    terms_and_conditions_page.applicable_law.assert_content

    expect(terms_and_conditions_page.responsible_use).to have_header
    terms_and_conditions_page.responsible_use.assert_content

    expect(terms_and_conditions_page.gdpr).to have_header
    terms_and_conditions_page.gdpr.assert_content

    expect(terms_and_conditions_page.hmcts_notice).to have_header

    expect(terms_and_conditions_page.hmcts_notice).to have_purpose_header
    terms_and_conditions_page.hmcts_notice.assert_purpose_content

    expect(terms_and_conditions_page.hmcts_notice).to have_about_personal_data_header
    terms_and_conditions_page.hmcts_notice.assert_about_personal_data_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_collect_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_collect_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_use_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_use_content

    expect(terms_and_conditions_page.hmcts_notice).to have_non_personal_use_header
    terms_and_conditions_page.hmcts_notice.assert_non_personal_use_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_stored_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_stored_content

    expect(terms_and_conditions_page.hmcts_notice).to have_non_personal_data_stored_header
    terms_and_conditions_page.hmcts_notice.assert_non_personal_data_stored_content

    expect(terms_and_conditions_page.hmcts_notice).to have_data_secure_header
    terms_and_conditions_page.hmcts_notice.assert_data_secure_content

    expect(terms_and_conditions_page.hmcts_notice).to have_disclosing_data_header
    terms_and_conditions_page.hmcts_notice.assert_disclosing_data_content

    expect(terms_and_conditions_page.hmcts_notice).to have_manage_sessions_header
    terms_and_conditions_page.hmcts_notice.assert_manage_sessions_content

    expect(terms_and_conditions_page.hmcts_notice).to have_access_personal_info_header
    terms_and_conditions_page.hmcts_notice.assert_access_personal_info_content

    expect(terms_and_conditions_page.hmcts_notice).to have_more_details_header
    terms_and_conditions_page.hmcts_notice.assert_more_details_content

    expect(terms_and_conditions_page.hmcts_notice).to have_make_complaint_header
    terms_and_conditions_page.hmcts_notice.assert_make_complaint_content

    expect(terms_and_conditions_page.hmcts_notice).to have_complaints_header
    terms_and_conditions_page.hmcts_notice.assert_complaints_content

    expect(terms_and_conditions_page.disclaimer).to have_header
    terms_and_conditions_page.disclaimer.assert_content
  end

  scenario "from confirmation of supplied details page" do
    confirmation_of_supplied_details_page.load(locale: current_locale_parameter)

    confirmation_of_supplied_details_page.terms.click

    expect(terms_and_conditions_page).to be_displayed

    expect(terms_and_conditions_page).to have_general_terms_link
    expect(terms_and_conditions_page).to have_applicable_law_link
    expect(terms_and_conditions_page).to have_responsible_use_link
    expect(terms_and_conditions_page).to have_gdpr_link
    expect(terms_and_conditions_page).to have_hmcts_notice_link
    expect(terms_and_conditions_page).to have_disclaimer_link

    expect(terms_and_conditions_page).to have_introduction

    expect(terms_and_conditions_page.general_terms).to have_header
    terms_and_conditions_page.general_terms.assert_content

    expect(terms_and_conditions_page.applicable_law).to have_header
    terms_and_conditions_page.applicable_law.assert_content

    expect(terms_and_conditions_page.responsible_use).to have_header
    terms_and_conditions_page.responsible_use.assert_content

    expect(terms_and_conditions_page.gdpr).to have_header
    terms_and_conditions_page.gdpr.assert_content

    expect(terms_and_conditions_page.hmcts_notice).to have_header

    expect(terms_and_conditions_page.hmcts_notice).to have_purpose_header
    terms_and_conditions_page.hmcts_notice.assert_purpose_content

    expect(terms_and_conditions_page.hmcts_notice).to have_about_personal_data_header
    terms_and_conditions_page.hmcts_notice.assert_about_personal_data_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_collect_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_collect_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_use_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_use_content

    expect(terms_and_conditions_page.hmcts_notice).to have_non_personal_use_header
    terms_and_conditions_page.hmcts_notice.assert_non_personal_use_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_stored_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_stored_content

    expect(terms_and_conditions_page.hmcts_notice).to have_non_personal_data_stored_header
    terms_and_conditions_page.hmcts_notice.assert_non_personal_data_stored_content

    expect(terms_and_conditions_page.hmcts_notice).to have_data_secure_header
    terms_and_conditions_page.hmcts_notice.assert_data_secure_content

    expect(terms_and_conditions_page.hmcts_notice).to have_disclosing_data_header
    terms_and_conditions_page.hmcts_notice.assert_disclosing_data_content

    expect(terms_and_conditions_page.hmcts_notice).to have_manage_sessions_header
    terms_and_conditions_page.hmcts_notice.assert_manage_sessions_content

    expect(terms_and_conditions_page.hmcts_notice).to have_access_personal_info_header
    terms_and_conditions_page.hmcts_notice.assert_access_personal_info_content

    expect(terms_and_conditions_page.hmcts_notice).to have_more_details_header
    terms_and_conditions_page.hmcts_notice.assert_more_details_content

    expect(terms_and_conditions_page.hmcts_notice).to have_make_complaint_header
    terms_and_conditions_page.hmcts_notice.assert_make_complaint_content

    expect(terms_and_conditions_page.hmcts_notice).to have_complaints_header
    terms_and_conditions_page.hmcts_notice.assert_complaints_content

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

    expect(terms_and_conditions_page).to have_general_terms_link
    expect(terms_and_conditions_page).to have_applicable_law_link
    expect(terms_and_conditions_page).to have_responsible_use_link
    expect(terms_and_conditions_page).to have_gdpr_link
    expect(terms_and_conditions_page).to have_hmcts_notice_link
    expect(terms_and_conditions_page).to have_disclaimer_link

    expect(terms_and_conditions_page).to have_introduction

    expect(terms_and_conditions_page.general_terms).to have_header
    terms_and_conditions_page.general_terms.assert_content

    expect(terms_and_conditions_page.applicable_law).to have_header
    terms_and_conditions_page.applicable_law.assert_content

    expect(terms_and_conditions_page.responsible_use).to have_header
    terms_and_conditions_page.responsible_use.assert_content

    expect(terms_and_conditions_page.gdpr).to have_header
    terms_and_conditions_page.gdpr.assert_content

    expect(terms_and_conditions_page.hmcts_notice).to have_header

    expect(terms_and_conditions_page.hmcts_notice).to have_purpose_header
    terms_and_conditions_page.hmcts_notice.assert_purpose_content

    expect(terms_and_conditions_page.hmcts_notice).to have_about_personal_data_header
    terms_and_conditions_page.hmcts_notice.assert_about_personal_data_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_collect_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_collect_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_use_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_use_content

    expect(terms_and_conditions_page.hmcts_notice).to have_non_personal_use_header
    terms_and_conditions_page.hmcts_notice.assert_non_personal_use_content

    expect(terms_and_conditions_page.hmcts_notice).to have_personal_data_stored_header
    terms_and_conditions_page.hmcts_notice.assert_personal_data_stored_content

    expect(terms_and_conditions_page.hmcts_notice).to have_non_personal_data_stored_header
    terms_and_conditions_page.hmcts_notice.assert_non_personal_data_stored_content

    expect(terms_and_conditions_page.hmcts_notice).to have_data_secure_header
    terms_and_conditions_page.hmcts_notice.assert_data_secure_content

    expect(terms_and_conditions_page.hmcts_notice).to have_disclosing_data_header
    terms_and_conditions_page.hmcts_notice.assert_disclosing_data_content

    expect(terms_and_conditions_page.hmcts_notice).to have_manage_sessions_header
    terms_and_conditions_page.hmcts_notice.assert_manage_sessions_content

    expect(terms_and_conditions_page.hmcts_notice).to have_access_personal_info_header
    terms_and_conditions_page.hmcts_notice.assert_access_personal_info_content

    expect(terms_and_conditions_page.hmcts_notice).to have_more_details_header
    terms_and_conditions_page.hmcts_notice.assert_more_details_content

    expect(terms_and_conditions_page.hmcts_notice).to have_make_complaint_header
    terms_and_conditions_page.hmcts_notice.assert_make_complaint_content

    expect(terms_and_conditions_page.hmcts_notice).to have_complaints_header
    terms_and_conditions_page.hmcts_notice.assert_complaints_content

    expect(terms_and_conditions_page.disclaimer).to have_header
    terms_and_conditions_page.disclaimer.assert_content
  end

end

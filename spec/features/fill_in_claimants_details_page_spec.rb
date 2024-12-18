require 'rails_helper'
RSpec.feature "Fill in Claimants Details Page", :js do
  let(:earnings_and_benefits_page) { ET3::Test::EarningsAndBenefitsPage.new }

  before do
    given_valid_user
    start_a_new_et3_response
    registration_start
  end

  scenario "correctly will enable user to continue to next page" do
    claimants_details_page.load(locale: current_locale_parameter)
    given_valid_data
    answer_claimants_details
    expect(earnings_and_benefits_page).to be_displayed
  end

  scenario "incorrectly will provide many errors" do
    claimants_details_page.load(locale: current_locale_parameter)
    claimants_invalid_dates
    answer_claimants_details
    claimants_details_page.next

    expect(claimants_details_page).to have_header
    expect(claimants_details_page).to have_error_header
    claimants_details_page.employment_end.assert_error_message(t('errors.custom.employment_end_before_start'))
  end

  scenario "correctly will enable user to check answers and return to edit them" do
    claimants_details_page.load(locale: current_locale_parameter)
    given_valid_data
    answer_claimants_details
    confirmation_of_supplied_details_page.load(locale: current_locale_parameter)
    confirmation_of_supplied_details_page.confirmation_of_claimants_details_answers.edit_claimants_details_page_link.click

    expect(claimants_details_page).to be_displayed
    expect(claimants_details_page).to have_header
    expect(claimants_details_page.claimants_name_question.value).to eql @claimant.claimants_name
    expect(claimants_details_page.agree_with_early_conciliation_details_question.value).to eql(t(@claimant.agree_with_early_conciliation_details))
    expect(claimants_details_page.disagree_conciliation_reason.value).to eql(@claimant.disagree_conciliation_reason) if @claimant.agree_with_early_conciliation_details_question.to_s.split('.').last == 'no'
    expect(claimants_details_page.agree_with_employment_dates_question.value).to eql(t("questions.claimants_details.agree_with_employment_dates.options.#{@claimant.agree_with_employment_dates}"))
    if @claimant.agree_with_employment_dates.to_s.split('.').last == 'no'
      expect(claimants_details_page.employment_start.value).to eql Date.parse(@claimant.employment_start)
      expect(claimants_details_page.employment_end.value).to eql Date.parse(@claimant.employment_end)
      expect(claimants_details_page.disagree_employment.value).to eql @claimant.disagree_employment
    end
    expect(claimants_details_page.continued_employment_question.value).to eql(t("questions.claimants_details.continued_employment.options.#{@claimant.continued_employment}"))
    expect(claimants_details_page.agree_with_claimants_description_of_job_or_title_question.value).to eql(t("questions.claimants_details.agree_with_claimants_description_of_job_or_title.options.#{@claimant.agree_with_claimants_description_of_job_or_title}"))
    expect(claimants_details_page.disagree_claimants_job_or_title.value).to eql(@claimant.disagree_claimants_job_or_title)
  end

  scenario 'Will be able to go to the next page without answering anything' do
    claimants_details_page.load(locale: current_locale_parameter)
    claimants_details_page.next

    expect(earnings_and_benefits_page).to be_displayed
  end

  scenario 'Will give an error if the end date is before the start date' do
    claimants_details_page.load(locale: current_locale_parameter)
    claimants_invalid_dates
    answer_claimants_details

    expect(claimants_details_page).to have_header
    expect(claimants_details_page).to have_error_header
    claimants_details_page.employment_end.assert_error_message(t('errors.custom.employment_end_before_start'))
  end
end

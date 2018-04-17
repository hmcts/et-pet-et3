require 'rails_helper'
RSpec.feature "Fill in Claimants Details Page", js: true do
  let(:earnings_and_benefits_page) { ET3::Test::EarningsAndBenefitsPage.new }

  scenario "correctly will enable user to continue to next page" do
    claimants_details_page.load

    given_i_am(:company01)

    answer_claimants_name_question
    answer_agree_with_early_conciliation_details_question
    answer_agree_with_employment_dates_question
    answer_continued_employment_question
    answer_agree_with_claimants_description_of_job_or_title_question

    claimants_details_page.next

    expect(earnings_and_benefits_page).to be_displayed
  end

  scenario "incorrectly will provide many errors" do
    claimants_details_page.load

    given_i_am(:erroneously_entering_data)

    answer_claimants_name_question
    answer_agree_with_early_conciliation_details_question
    answer_agree_with_employment_dates_question
    answer_continued_employment_question
    answer_agree_with_claimants_description_of_job_or_title_question

    claimants_details_page.next

    expect(claimants_details_page).to have_error_header
    expect(claimants_details_page.claimants_name_question).to have_error_contains_numbers
    expect(claimants_details_page.agree_with_employment_dates_question.employment_start).to have_error_blank
    expect(claimants_details_page.agree_with_employment_dates_question.employment_end).to have_error_blank
    expect(claimants_details_page.agree_with_employment_dates_question.disagree_employment).to have_error_blank
  end
end

require 'rails_helper'
RSpec.feature "Fill in Claimants Details Page", js: true do
  let(:earnings_and_benefits_page) { ET3::Test::EarningsAndBenefitsPage.new }

  scenario "correctly will enable user to continue to next page" do
    claimants_details_page.load
    given_i_am
    answer_claimants_details
    expect(earnings_and_benefits_page).to be_displayed
  end

  scenario "incorrectly will provide many errors" do
    claimants_details_page.load
    given_invalid_data
    answer_claimants_details
    claimants_details_page.next

    expect(claimants_details_page).to have_header
    expect(claimants_details_page).to have_error_header
    expect(claimants_details_page.claimants_name_question).to have_error_contains_numbers
    expect(claimants_details_page.agree_with_employment_dates_question.employment_start).to have_error_blank
    expect(claimants_details_page.agree_with_employment_dates_question.employment_end).to have_error_blank
    expect(claimants_details_page.agree_with_employment_dates_question.disagree_employment).to have_error_blank
  end

  scenario "correctly will enable user to check answers and return to edit them" do
    claimants_details_page.load
    given_i_am
    answer_claimants_details
    claimants_details_page.next
    confirmation_of_supplied_details_page.load
    confirmation_of_supplied_details_page.confirmation_of_claimants_details_answers.edit_page_link.click

    expect(claimants_details_page).to be_displayed
    expect(claimants_details_page.claimants_name_question.field.value).to eql @claimant.claimants_name
    # expect(claimants_details_page.agree_with_early_conciliation_details_question.get).to eql @claimant.agree_with_early_conciliation_details
    expect(claimants_details_page.disagree_conciliation_reason.text).to eql @claimant.disagree_conciliation_reason
    # expect(claimants_details_page.agree_with_employment_dates_question.get).to eql @claimant.agree_with_employment_dates
    expect(claimants_details_page.agree_with_employment_dates_question.employment_start.assert_date_for(@claimant)).to be true
    expect(claimants_details_page.agree_with_employment_dates_question.employment_end.assert_date_for(@claimant)).to be true
    expect(claimants_details_page.agree_with_employment_dates_question.disagree_employment.field.text).to eql @claimant.disagree_employment
    # expect(claimants_details_page.continued_employment_question.get).to eql @claimant.continued_employment
    # expect(claimants_details_page.agree_with_claimants_description_of_job_or_title_question.get).to eql @claimant.agree_with_claimants_description_of_job_or_title
    expect(claimants_details_page.agree_with_claimants_description_of_job_or_title_question.disagree_claimants_job_or_title.text).to eql @claimant.disagree_claimants_job_or_title

  end
end



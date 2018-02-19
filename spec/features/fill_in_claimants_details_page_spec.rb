require 'rails_helper'
RSpec.feature "Fill in Claimants Details Page", js: true do
  let(:earnings_and_benefits_page) { ET3::Test::EarningsAndBenefitsPage.new }

  scenario "correctly will enable user to continue to next page" do
    claimants_details_page.load

    given_i_am(:company01)

    answer_claimants_name_question
    answer_early_conciliation_details_question
    answer_employment_dates_question
    answer_continued_employment_question
    answer_claimants_description_of_job_or_title_question

    claimants_details_page.next

    expect(earnings_and_benefits_page).to be_displayed
  end
end

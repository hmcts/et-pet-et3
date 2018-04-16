require 'rails_helper'
RSpec.feature "Fill in Earnings and Benefits Page", js: true do
  let(:response_page) { ET3::Test::ResponsePage.new }

  scenario "correctly will enable user to continue to next page" do
    earnings_and_benefits_page.load

    given_i_am(:company01)

    answer_agree_with_claimants_hours_question
    answer_agree_with_earnings_details_question
    answer_agree_with_claimant_notice_question
    answer_agree_with_claimant_pension_benefits_question

    earnings_and_benefits_page.next

    expect(response_page).to be_displayed
  end

  scenario "incorrectly will provide many errors" do
    earnings_and_benefits_page.load

    given_i_am(:erroneously_entering_data)

    answer_agree_with_claimants_hours_question
    answer_agree_with_earnings_details_question
    answer_agree_with_claimant_notice_question
    answer_agree_with_claimant_pension_benefits_question

    earnings_and_benefits_page.next

    expect(earnings_and_benefits_page).to have_error_header
    expect(earnings_and_benefits_page.agree_with_claimants_hours_question).to have_error_not_a_number
    expect(earnings_and_benefits_page.agree_with_earnings_details_question).to have_error_not_a_number
    expect(earnings_and_benefits_page.agree_with_earnings_details_question).to have_error_not_a_number
    expect(earnings_and_benefits_page.agree_with_claimant_notice_question).to have_error_too_long
    expect(earnings_and_benefits_page.agree_with_claimant_pension_benefits_question).to have_error_too_long
  end
end

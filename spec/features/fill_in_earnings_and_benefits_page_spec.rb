require 'rails_helper'
RSpec.feature "Fill in Earnings and Benefits Page", js: true do
  let(:response_page) { ET3::Test::ResponsePage.new }

  scenario "correctly will enable user to continue to next page" do
    earnings_and_benefits_page.load(locale: current_locale_parameter)
    given_valid_data
    answer_earnings_and_benefits
    expect(response_page).to be_displayed
  end

  scenario "incorrectly will provide many errors" do
    earnings_and_benefits_page.load(locale: current_locale_parameter)
    given_invalid_data
    answer_earnings_and_benefits

    expect(earnings_and_benefits_page).to have_header
    expect(earnings_and_benefits_page).to have_error_header
    expect(earnings_and_benefits_page.agree_with_claimants_hours_question).to have_error_not_a_number
    expect(earnings_and_benefits_page.agree_with_earnings_details_question.queried_pay_before_tax).to have_error_not_a_number
    expect(earnings_and_benefits_page.agree_with_earnings_details_question.queried_take_home_pay).to have_error_not_a_number
    expect(earnings_and_benefits_page.agree_with_claimant_notice_question).to have_error_too_long
    expect(earnings_and_benefits_page.agree_with_claimant_pension_benefits_question).to have_error_too_long
  end

  scenario "correctly will enable user to check answers and return to edit them" do
    earnings_and_benefits_page.load(locale: current_locale_parameter)
    given_valid_data
    answer_earnings_and_benefits
    confirmation_of_supplied_details_page.load(locale: current_locale_parameter)
    confirmation_of_supplied_details_page.confirmation_of_earnings_and_benefits_answers.edit_page_link.click

    expect(earnings_and_benefits_page).to be_displayed
    user = @claimant

    earnings_and_benefits_page.agree_with_claimants_hours_question.assert_answers_for(user)
    earnings_and_benefits_page.agree_with_earnings_details_question.assert_answers_for(user)
    earnings_and_benefits_page.agree_with_claimant_notice_question.assert_answers_for(user)
    earnings_and_benefits_page.agree_with_claimant_pension_benefits_question.assert_answers_for(user)
  end
end

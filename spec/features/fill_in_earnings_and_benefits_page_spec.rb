require 'rails_helper'
RSpec.feature "Fill in Earnings and Benefits Page", js: true do
  let(:response_page) { ET3::Test::ResponsePage.new }

  scenario "correctly will enable user to continue to next page" do
    earnings_and_benefits_page.load(locale: current_locale_parameter)

    given_i_am(:company01)

    answer_agree_with_claimants_hours_question
    answer_agree_with_earnings_details_question
    answer_agree_with_claimant_notice_question
    answer_agree_with_claimant_pension_benefits_question

    earnings_and_benefits_page.next

    expect(response_page).to be_displayed
  end

  scenario "incorrectly will provide many errors" do
    earnings_and_benefits_page.load(locale: current_locale_parameter)

    given_i_am(:erroneously_entering_data)

    answer_agree_with_claimants_hours_question
    answer_agree_with_earnings_details_question
    answer_agree_with_claimant_notice_question
    answer_agree_with_claimant_pension_benefits_question

    earnings_and_benefits_page.next

    expect(earnings_and_benefits_page).to have_error_header
    expect(earnings_and_benefits_page.agree_with_claimants_hours_question).to have_error_not_a_number
    expect(earnings_and_benefits_page.agree_with_earnings_details_question.queried_pay_before_tax).to have_error_not_a_number
    expect(earnings_and_benefits_page.agree_with_earnings_details_question.queried_take_home_pay).to have_error_not_a_number
    expect(earnings_and_benefits_page.agree_with_claimant_notice_question).to have_error_too_long
    expect(earnings_and_benefits_page.agree_with_claimant_pension_benefits_question).to have_error_too_long
  end

  scenario "correctly will enable user to check answers and return to edit them" do
    earnings_and_benefits_page.load(locale: current_locale_parameter)

    given_i_am(:company01)

    answer_agree_with_claimants_hours_question
    answer_agree_with_earnings_details_question
    answer_agree_with_claimant_notice_question
    answer_agree_with_claimant_pension_benefits_question

    earnings_and_benefits_page.next
    confirmation_of_supplied_details_page.load(locale: current_locale_parameter)
    confirmation_of_supplied_details_page.confirmation_of_earnings_and_benefits_answers.edit_page_link.click

    expect(earnings_and_benefits_page).to be_displayed
    expect(earnings_and_benefits_page.agree_with_claimants_hours_question.get).to eql user.agree_with_claimants_hours
    expect(earnings_and_benefits_page.agree_with_claimants_hours_question.queried_hours.field.value.to_f).to eql user.queried_hours.to_f if user.agree_with_claimants_hours == "No"
    expect(earnings_and_benefits_page.agree_with_earnings_details_question.get).to eql user.agree_with_earnings_details
    expect(earnings_and_benefits_page.agree_with_earnings_details_question.queried_pay_before_tax.field.value).to eql user.queried_pay_before_tax.to_f if user.agree_with_earnings_details_question == "No"
    expect(earnings_and_benefits_page.agree_with_earnings_details_question.queried_pay_before_tax.monthly.has_checked_field?).to be true if user.queried_pay_before_tax_period == "Monthly"
    expect(earnings_and_benefits_page.agree_with_earnings_details_question.queried_pay_before_tax.weekly.has_checked_field?).to be true if user.queried_pay_before_tax_period == "Weekly"
    expect(earnings_and_benefits_page.agree_with_earnings_details_question.queried_take_home_pay.field.value).to eql user.queried_take_home_pay.to_f if user.agree_with_earnings_details_question == "Yes"
    expect(earnings_and_benefits_page.agree_with_earnings_details_question.queried_take_home_pay.monthly.has_checked_field?).to be true if user.queried_take_home_pay_period == "Monthly"
    expect(earnings_and_benefits_page.agree_with_earnings_details_question.queried_take_home_pay.weekly.has_checked_field?).to be true if user.queried_take_home_pay_period == "Weekly"
    expect(earnings_and_benefits_page.agree_with_claimant_notice_question.get).to eql user.agree_with_claimant_notice
    expect(earnings_and_benefits_page.agree_with_claimant_notice_question.disagree_claimant_notice_reason.root_element.value).to eql user.disagree_claimant_notice_reason if user.agree_with_claimant_notice == "No"
    expect(earnings_and_benefits_page.agree_with_claimant_pension_benefits_question.get).to eql user.agree_with_claimant_pension_benefits
    expect(earnings_and_benefits_page.agree_with_claimant_pension_benefits_question.disagree_claimant_pension_benefits_reason.root_element.value).to eql user.disagree_claimant_pension_benefits_reason if user.agree_with_claimant_pension_benefits == "No"
  end
end

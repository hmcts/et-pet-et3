require 'rails_helper'
RSpec.feature "Fill in Earnings and Benefits Page", :js do
  let(:response_page) { ET3::Test::ResponsePage.new }

  before do
    given_valid_user
    start_a_new_et3_response
    registration_start
  end

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
    earnings_and_benefits_page.queried_hours.assert_error_message(t('errors.custom.queried_hours.not_a_number'))
    earnings_and_benefits_page.queried_pay_before_tax.assert_error_message(t('errors.custom.queried_pay_before_tax.not_a_number'))
    earnings_and_benefits_page.queried_take_home_pay.assert_error_message(t('errors.custom.queried_take_home_pay.not_a_number'))
    earnings_and_benefits_page.disagree_claimant_notice_reason.set(Faker::Lorem.characters(number: 451))
    earnings_and_benefits_page.agree_with_claimant_notice_question.set(:yes)
    earnings_and_benefits_page.disagree_claimant_pension_benefits_reason.set(Faker::Lorem.characters(number: 351))
    earnings_and_benefits_page.agree_with_claimant_notice_question.set(:no)
    earnings_and_benefits_page.next
    earnings_and_benefits_page.disagree_claimant_notice_reason.assert_error_message(t('errors.messages.too_long'))
    earnings_and_benefits_page.disagree_claimant_pension_benefits_reason.assert_error_message(t('errors.messages.too_long'))
  end

  scenario "correctly will enable user to check answers and return to edit them" do
    earnings_and_benefits_page.load(locale: current_locale_parameter)
    given_valid_data
    answer_earnings_and_benefits
    confirmation_of_supplied_details_page.load(locale: current_locale_parameter)
    confirmation_of_supplied_details_page.confirmation_of_earnings_and_benefits_answers.edit_earnings_and_benefit_page_link.click

    expect(earnings_and_benefits_page).to be_displayed
    user = @claimant

    earnings_and_benefits_page.tap do |p|
      expect(p.agree_with_claimants_hours_question.value).to eql(t("questions.earnings_and_benefits.agree_with_claimants_hours.options.#{user.agree_with_claimants_hours}"))
      if user.agree_with_claimants_hours == :no
        expect(p.queried_hours.value).to eql user.queried_hours.to_s
      end
      expect(p.agree_with_earnings_details_question.value).to eql(t("questions.earnings_and_benefits.agree_with_claimants_hours.options.#{user.agree_with_earnings_details}"))
      if user.agree_with_earnings_details == :no
        expect(p.queried_pay_before_tax.value.gsub(',', '')).to eql sprintf('%.2f', user.queried_pay_before_tax)
        expect(p.queried_pay_before_tax_period.value).to eql t(user.queried_pay_before_tax_period)
        expect(p.queried_take_home_pay.value).to eql sprintf('%.2f', user.queried_take_home_pay)
        expect(p.queried_take_home_pay_period.value).to eql t(user.queried_take_home_pay_period)
      end
      expect(p.agree_with_claimant_notice_question.value).to eql(t("questions.earnings_and_benefits.agree_with_claimant_notice.options.#{user.agree_with_claimant_notice}"))
      if user.agree_with_claimant_notice == :no
        expect(p.disagree_claimant_notice_reason.value).to eql user.disagree_claimant_notice_reason
      end
      earnings_and_benefits_page.agree_with_claimant_notice_question.set(:yes)
      expect(p.agree_with_claimant_pension_benefits_question.value).to eql(t("questions.earnings_and_benefits.agree_with_claimant_pension_benefits.options.#{user.agree_with_claimant_pension_benefits}"))
      if user.agree_with_claimant_pension_benefits == :no
        expect(p.disagree_claimant_pension_benefits_reason.value).to eql user.disagree_claimant_pension_benefits_reason
      end
      earnings_and_benefits_page.agree_with_claimant_notice_question.set(:no)
    end
  end
end

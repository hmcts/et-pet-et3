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
end

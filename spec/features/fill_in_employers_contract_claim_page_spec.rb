require 'rails_helper'
RSpec.feature "Fill in Employers Contract Claim Page", js: true do
  let(:confirmation_of_supplied_details_page) { ET3::Test::ConfirmationOfSuppliedDetailsPage.new }

  scenario "correctly will enable user to continue to next page" do
    given_i_am(:company01)
    answer_all_questions

    expect(confirmation_of_supplied_details_page).to be_displayed
  end
end

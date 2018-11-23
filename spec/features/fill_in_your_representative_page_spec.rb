require 'rails_helper'
RSpec.feature "Fill in Your Representative Page", js: true do
  let(:your_representatives_details_page) { ET3::Test::YourRepresentativesDetailsPage.new }
  let(:employers_contract_claim_page) { ET3::Test::EmployersContractClaimPage.new }

  scenario "correctly will enable user to continue to representative details page" do
    your_representative_page.load(locale: current_locale_parameter)

    given_i_am(:company01)

    answer_have_representative_question

    your_representative_page.next

    expect(your_representatives_details_page).to be_displayed
  end

  scenario "correctly will enable user to continue to disability page" do
    your_representative_page.load(locale: current_locale_parameter)

    given_i_am(:a_respondent_without_a_representative)

    answer_have_representative_question

    your_representative_page.next

    expect(disability_page).to be_displayed
  end

  scenario "without selecting a radio button will continue to disability page" do
    your_representative_page.load(locale: current_locale_parameter)

    your_representative_page.next

    expect(disability_page).to be_displayed
  end

  scenario "correctly will enable user to check answers and return to edit them" do
    your_representative_page.load(locale: current_locale_parameter)

    given_i_am(:company01)

    answer_have_representative_question

    your_representative_page.next
    visit confirmation_of_supplied_details_path
    confirmation_of_supplied_details_page.confirmation_of_your_representative_answers.edit_page_link.click

    expect(your_representative_page).to be_displayed
    expect(your_representative_page.have_representative_question.get).to eql user.have_representative
  end
end

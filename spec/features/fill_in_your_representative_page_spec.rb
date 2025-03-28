require 'rails_helper'
RSpec.feature "Fill in Your Representative Page", :js do
  let(:your_representatives_details_page) { ET3::Test::YourRepresentativesDetailsPage.new }
  let(:employers_contract_claim_page) { ET3::Test::EmployersContractClaimPage.new }

  before do
    given_valid_user
    start_a_new_et3_response
    registration_start
  end

  scenario "correctly will enable user to continue to representative details page" do
    your_representative_page.load(locale: current_locale_parameter)
    given_valid_data
    your_representative_page.have_representative_question.set(@representative.have_representative.to_s.split('.').last.to_sym)
    your_representative_page.next

    expect(your_representatives_details_page).to be_displayed
  end

  scenario "correctly will enable user to continue to disability page" do
    your_representative_page.load(locale: current_locale_parameter)
    @representative = FactoryBot.create(:representative, :representative_valid, have_representative: :'questions.your_representatives.have_representative.options.yes')
    answer_representative

    expect(disability_page).to be_displayed
  end

  scenario "without selecting a radio button will continue to disability page" do
    your_representative_page.load(locale: current_locale_parameter)
    your_representative_page.next

    expect(disability_page).to be_displayed
  end

  scenario "correctly will enable user to check answers and return to edit them" do
    your_representative_page.load(locale: current_locale_parameter)
    given_valid_data
    answer_representative
    confirmation_of_supplied_details_page.load(locale: current_locale_parameter)
    confirmation_of_supplied_details_page.confirmation_of_your_representative_answers.edit_representative_page_link.click

    expect(your_representative_page).to have_header
    expect(your_representative_page.have_representative_question.value).to eql(t(@representative.have_representative))
  end
end

require 'rails_helper'
RSpec.feature "Fill in Case Heard By Page", js: true do
  before do
    given_valid_user
    start_a_new_et3_response
    registration_start
  end

  scenario "correctly will enable user to continue to next page" do
    case_heard_by_page.load(locale: current_locale_parameter)
    given_valid_data
    answer_case_heard_by

    expect(claimants_details_page).to be_displayed
  end

  scenario "hides the reason field until the judge option is selected and hides it again when changed" do
    case_heard_by_page.load(locale: current_locale_parameter)
    expect(case_heard_by_page).not_to have_case_heard_by_preference_reason_question
    case_heard_by_page.case_heard_by_preference_question.set(:judge)
    expect(case_heard_by_page).to have_case_heard_by_preference_reason_question
    case_heard_by_page.case_heard_by_preference_question.set(:no_preference)
    expect(case_heard_by_page).not_to have_case_heard_by_preference_reason_question
  end

  scenario "hides the reason field until the panel option is selected and hides it again when changed" do
    case_heard_by_page.load(locale: current_locale_parameter)
    expect(case_heard_by_page).not_to have_case_heard_by_preference_reason_question
    case_heard_by_page.case_heard_by_preference_question.set(:panel)
    expect(case_heard_by_page).to have_case_heard_by_preference_reason_question
    case_heard_by_page.case_heard_by_preference_question.set(:no_preference)
    expect(case_heard_by_page).not_to have_case_heard_by_preference_reason_question
  end

  scenario "incorrectly will provide many errors" do
    case_heard_by_page.load(locale: current_locale_parameter)

    case_heard_by_page.case_heard_by_preference_question.set(:judge)
    case_heard_by_page.next

    expect(case_heard_by_page).to have_header
    expect(case_heard_by_page).to have_error_header
    case_heard_by_page.case_heard_by_preference_reason_question.assert_error_message(t('errors.messages.blank'))
  end

  scenario "correctly will enable user to check answers and return to edit them" do
    case_heard_by_page.load(locale: current_locale_parameter)
    given_valid_data
    answer_case_heard_by
    confirmation_of_supplied_details_page.load(locale: current_locale_parameter)
    confirmation_of_supplied_details_page.confirmation_of_case_heard_by_answers.edit_case_heard_by_page_link.click
    user = @respondent

    expect(case_heard_by_page).to be_displayed
    expect(case_heard_by_page).to have_header
    expect(case_heard_by_page.case_heard_by_preference_question.value).to eql t(:"questions.case_heard_by.case_heard_by_preference.options.#{user.case_heard_by_preference}")
    expect(case_heard_by_page.case_heard_by_preference_reason_question.value).to eql user.case_heard_by_preference_reason
  end
end

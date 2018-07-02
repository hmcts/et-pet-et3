require 'rails_helper'

RSpec.feature "Access invalid URL", js: true do
  let(:not_found_page) { ET3::Test::NotFoundPage.new }

  scenario "returns custom 404 page" do
    visit '/respond/this_page_does_not_exist'

    expect(not_found_page.header).to have_text("Page not found")
    expect(not_found_page.subheader).to have_text("Sorry, this page does not exist.")
    expect(not_found_page.paragraph1).to have_text("If you entered a web address, please check it's correct.")
    expect(not_found_page.paragraph2).to have_link("Employment Tribunals Homepage", href: 'https://www.gov.uk/courts-tribunals/employment-tribunal')
  end
end

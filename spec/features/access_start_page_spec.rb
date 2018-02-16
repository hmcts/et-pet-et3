require 'rails_helper'

RSpec.feature "Access Start Page" do
  scenario "user will read text and begin form" do
    start_page.load

    expect(start_page).to be_displayed
    expect(start_page).to have_hello_world
  end
end

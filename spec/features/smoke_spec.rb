require 'smoke_test_helper'

RSpec.describe 'Smoke test', :js, type: :feature do
  let(:earnings_and_benefits_page) { ET3::Test::EarningsAndBenefitsPage.new }

  before do
    given_valid_user
    start_a_new_et3_response
    registration_start
  end

  after do |example|
    if example.exception
      require 'nokogiri'
      puts "\n" + ("=" * 80)
      puts "SMOKE TEST FAILURE DEBUG INFO"
      puts "=" * 80
      puts "Current URL: #{page.current_url}"
      puts "Page Title: #{begin
        page.title
      rescue StandardError
        'N/A'
      end}"
      puts "\nPage Body Text:"
      puts "-" * 80
      puts page.text[0..2000]
      puts "-" * 80
      puts "\nFormatted HTML:"
      puts "-" * 80
      begin
        doc = Nokogiri::HTML(page.html)
        puts doc.to_html(indent: 2)[0..10000]
      rescue StandardError => e
        puts "Could not format HTML: #{e.message}"
        puts page.html[0..5000]
      end
      puts "-" * 80
      puts ("=" * 80) + "\n"
    end
  end

  it 'runs a successful smoke test', :smoke do
    claimants_details_page.load(locale: current_locale_parameter)
    given_valid_data
    answer_claimants_details
    expect(earnings_and_benefits_page).to be_displayed
  end
end

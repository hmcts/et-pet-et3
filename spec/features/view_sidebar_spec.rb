require 'rails_helper'

RSpec.feature "View Sidebar", js: true do
  include ET3::Test::I18n

  scenario "start page" do
    start_page.load(locale: current_locale_parameter)

    expect(start_page.sidebar).to have_link(t('components.sidebar.claim_link'), href: t('components.sidebar.claim_href'))
    expect(start_page.sidebar).to have_link(t('components.sidebar.response_link'), href: t('components.sidebar.response_href'))
    expect(start_page.sidebar).to have_link(t('components.sidebar.download_link'), href: t('components.sidebar.download_href'))
    expect(start_page.sidebar).to have_link(t('components.sidebar.more_category_link'), href: t('components.sidebar.more_category_href'))
  end

end

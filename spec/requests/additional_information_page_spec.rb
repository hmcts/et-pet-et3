require 'rails_helper'

RSpec.describe "Additional information page", type: :request do
  require 'rails_helper'
  before do
    Rails.application.reload_routes!
    sign_in user
  end

  let(:user) { FactoryBot.create(:user) }

  describe "/respond/additional_information" do
    include_examples 'google tag manager', page_object_class: ET3::Test::AdditionalInformationPage
  end
end

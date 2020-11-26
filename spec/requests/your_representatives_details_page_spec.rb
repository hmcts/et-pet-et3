require 'rails_helper'

RSpec.describe "Your representatives details page", type: :request do

  before do
    sign_in user
  end

  let(:user) { FactoryBot.create(:user) }

  describe "/respond/your_representatives_details" do
    include_examples 'google tag manager', page_object_class: ET3::Test::YourRepresentativesDetailsPage
  end
end

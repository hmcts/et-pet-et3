require 'rails_helper'

RSpec.describe "Earnings and benefits details page", type: :request do

  before do
    sign_in user
  end

  let(:user) { create(:user) }

  describe "/respond/earnings_and_benefits" do
    include_examples 'google tag manager', page_object_class: ET3::Test::EarningsAndBenefitsPage
  end
end

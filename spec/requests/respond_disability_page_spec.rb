require 'rails_helper'

RSpec.describe "Respond disability page", type: :request do

  before do
    sign_in user
  end

  let(:user) { create(:user) }

  describe "/respond/disability" do
    include_examples 'google tag manager', page_object_class: ET3::Test::DisabilityPage
  end
end

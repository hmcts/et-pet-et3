require 'rails_helper'

RSpec.describe "Your representative page", type: :request do

  before do
    sign_in user
  end

  let(:user) { FactoryBot.create(:user) }

  describe "/respond/your_representative" do
    include_examples 'google tag manager', page_object_class: ET3::Test::YourRepresentativePage
  end
end

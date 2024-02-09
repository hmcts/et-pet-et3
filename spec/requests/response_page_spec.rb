require 'rails_helper'

RSpec.describe "Response page", type: :request do

  before do
    sign_in user
  end

  let(:user) { create(:user) }

  describe "/respond/response" do
    include_examples 'google tag manager', page_object_class: ET3::Test::ResponsePage
  end
end

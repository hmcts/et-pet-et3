require 'rails_helper'

RSpec.describe "Case heard by page", type: :request do

  before do
    sign_in user
  end

  let(:user) { FactoryBot.create(:user) }

  describe "/respond/case-heard-by" do
    include_examples 'google tag manager', page_object_class: ET3::Test::CaseHeardByPage
  end
end

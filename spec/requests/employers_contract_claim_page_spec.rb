require 'rails_helper'

RSpec.describe "Employers contract claim page", type: :request do

  before do
    sign_in user
  end

  let(:user) { create(:user) }

  describe "/respond/employers_contract_claim" do
    include_examples 'google tag manager', page_object_class: ET3::Test::EmployersContractClaimPage
  end
end

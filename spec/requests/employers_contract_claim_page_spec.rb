require 'rails_helper'

RSpec.describe "Employers contract claim page", type: :request do
  describe "/respond/employers_contract_claim" do
    include_examples 'google tag manager', page_object_class: ET3::Test::EmployersContractClaimPage
  end
end

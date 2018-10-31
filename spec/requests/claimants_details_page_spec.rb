require 'rails_helper'

RSpec.describe "Claimants details page", type: :request do
  describe "/respond/claimants_details" do
    include_examples 'google tag manager', page_object_class: ET3::Test::ClaimantsDetailsPage
  end
end

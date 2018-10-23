require 'rails_helper'

RSpec.describe "Confirmation of supplied details page", type: :request do
  describe "/respond/confirmation_of_supplied_details" do
    include_examples 'google tag manager', page_object_class: ET3::Test::ConfirmationOfSuppliedDetailsPage
  end
end

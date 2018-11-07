require 'rails_helper'

RSpec.describe "Additional information page", type: :request do
  describe "/respond/additional_information" do
    include_examples 'google tag manager', page_object_class: ET3::Test::AdditionalInformationPage
  end
end

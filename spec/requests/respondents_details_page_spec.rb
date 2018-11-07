require 'rails_helper'

RSpec.describe "Respondent details page", type: :request do
  describe "/respond/respondents_details" do
    include_examples 'google tag manager', page_object_class: ET3::Test::RespondentsDetailsPage
  end
end

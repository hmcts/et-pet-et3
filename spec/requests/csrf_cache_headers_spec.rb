require 'rails_helper'

RSpec.describe "CSRF cache headers", type: :request do
  around do |example|
    original_value = ActionController::Base.allow_forgery_protection
    ActionController::Base.allow_forgery_protection = true
    example.run
  ensure
    ActionController::Base.allow_forgery_protection = original_value
  end

  it "returns non-storable headers for invalid authenticity token responses" do
    app = ActionDispatch::Integration::Session.new(Rails.application)
    app.post "/cookies", params: { cookie: { usage: true, return_path: "/" } }

    expect(app.response).to have_http_status(:unprocessable_entity)
    expect(app.response.headers["Cache-Control"]).to include("no-store")
  end
end

require 'rails_helper'

RSpec.describe "Not found responses", type: :request do
  it "returns app security headers for unmatched HTML routes" do
    get "/users/sign_out"

    expect(response).to have_http_status(:not_found)
    expect(response.headers["Content-Security-Policy"]).to be_present
    expect(response.headers["X-Frame-Options"]).to eq("SAMEORIGIN")
  end

  it "returns a 404 XML response for unmatched XML routes" do
    get "/sitemap.xml"

    expect(response).to have_http_status(:not_found)
    expect(response.media_type).to eq("application/xml")
  end
end

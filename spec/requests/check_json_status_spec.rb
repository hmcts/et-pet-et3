require 'rails_helper'

RSpec.describe "Check JSON Status", type: :request do
  describe "/healthcheck.json" do
    it "responds with status" do
      get '/healthcheck.json'

      expect(JSON.parse(response.body, symbolize_names: true)).to eq(status: "ok")
    end
  end

  describe "/ping.json" do
    it "responds with 'version_number', 'build_date', 'commit_id' and 'build_tag'" do
      get '/ping.json'

      expect(JSON.parse(response.body)).to include 'version_number', 'build_date', 'commit_id', 'build_tag'
    end
  end

end

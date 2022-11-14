require 'rails_helper'

RSpec.describe "CampaignsController:", type: :request do
  describe "Campaigns Index" do
    it "Get All Campaigns" do
      get api_v1_campaigns_path(format: :json)
      expect(response).to be_successful
    end
  end
  describe "Campaigns CRUD" do
    it "Create new Campaign" do
      post api_v1_campaigns_path(format: :json), params: {campaign: {
        name: "Test Campaign",
        minplayers: "2",
        maxplayers: "4"
      }}
      expect(response).to be_successful
    end
    it "Get a specific campaign" do
      get api_v1_campaigns_path(id: "1")
      expect(response).to be_successful
    end
    it "Updates a Campaign" do
      patch api_v1_campaign_path(id: "1"), params: {campaign: {
        name: "TestChange",
        minplayers: "3",
        maxplayers: "6"
      }}
      expect(response).to be_successful
    end
    it "Deletes a Campaign" do
      delete api_v1_campaign_path(id: "1")
      expect(response).to be_successful
    end
  end
end

require 'rails_helper'

RSpec.describe "CampaignsController:", type: :request do
  before :each do
    @campaign = Campaign.create({
      name: "Test Campaign",
      minplayers: "2",
      maxplayers: "4"
    })
    @test_user = User.create({
      username: "tester1",
      email: "tester1@test.test",
      password: "password",
      password_confirmation: "password"
    })
    @character = Character.create({
      user_id: @test_user.id,
      name: "Tony Stark",
      strength: "10",
      dexterity: "10",
      constitution: "10",
      intelligence: "10",
      wisdom: "10",
      charisma: "10"
    })
  end
  describe "Campaigns Index" do
    it "Get All Campaigns" do
      get api_v1_campaigns_path(format: :json)
      expect(response).to be_successful
    end
  end
  describe "Campaigns CRUD:" do
    it "Create new Campaign" do
      expect {post api_v1_campaigns_path(format: :json), params: {campaign: {
        name: "Create Campaign Test",
        minplayers: "3",
        maxplayers: "5"
      }}}.to change(Campaign, :count).by(1)
      expect(response).to be_successful
    end
    it "Get a specific campaign" do
      get api_v1_campaign_path(id: @campaign.id)
      json = JSON.parse(response.body)
      expect(json["data"]["id"]).to eq(@campaign.id)
      expect(response).to be_successful
    end
    it "Update a Campaign" do
      put api_v1_campaign_path(@campaign.id), params: {campaign: {
        name: "TestChange",
        minplayers: "3",
        maxplayers: "6"
      }}
      json = JSON.parse(response.body)
      expect(json["data"]["name"]).to eq("TestChange")
      expect(response).to be_successful
    end
    it "Deletes a Campaign" do
      expect {delete api_v1_campaign_path(@campaign.id)}.to change(Campaign, :count).by(-1)
      expect(response).to be_successful
    end
  end
  describe "Campaign Memberships:" do
    it "Adds a Character to a Campaign" do
      expect {post add_character_api_v1_campaign_path(@campaign.id), params: {character_id: @character.id}}.to change(Membership, :count).by(1)
      expect(response).to be_successful
    end
    it "Removes a Character from a Campaign" do
      @campaign.characters << @character
      expect {delete remove_character_api_v1_campaign_path(@campaign.id), params: {character_id: @character.id}}.to change(Membership, :count).by(-1)
      expect(response).to be_successful
    end
  end
end

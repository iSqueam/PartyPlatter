require 'rails_helper'

RSpec.describe "Characters:", type: :request do
  describe "Character CRUD:" do
    it "Get all Characters" do
      get api_v1_characters_path(format: :json)
    end
    it "Creates a new Character" do
      post api_v1_characters_path(format: :json), params: {character: {
        user: Faker::Internet.user,
        name: "testy",
        strength: "10",
        dexterity: "10",
        constitution: "10",
        intelligence: "10",
        wisdom: "10",
        charisma: "10"
      }}
      expect(response).to be_successful
    end
    it "Rejects character with stat too high" do
      post api_v1_characters_path(format: :json), params: {character: {
        user: Faker::Internet.user,
        name: "testy",
        strength: "10",
        dexterity: "10",
        constitution: "10",
        intelligence: "10",
        wisdom: "10",
        charisma: "21"
      }}
      expect(response).not_to be_successful
    end
  end
end

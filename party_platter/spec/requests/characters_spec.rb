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
    it "GET a specific characterr" do
      post api_v1_characters_path(format: :json), params: {character: {
        #user: Faker::Internet.user,
        id: "1"
      }}
      expect(response).to be_successful
    end
    it "UPDATE a specific character" do
      patch api_v1_character_path(id: "1"), params: {character: {
        #id: "1",
        name: "New Name",
        strength: "10",
        dexterity: "10",
        constitution: "10",
        intelligence: "10",
        wisdom: "10",
        charisma: "10"
        }}
      expect(response).to be_successful
    end
    it "DESTROY a specific character" do
      delete api_v1_character_path(id: "1")
      expect(response).to be_successful
    end
  end
end

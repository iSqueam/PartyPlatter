require 'rails_helper'

RSpec.describe "Characters:", type: :request do
  before :each do
    @test_user = User.create({
      username: "tester1",
      email: "tester1@test.test",
      password: "password",
      password_confirmation: "password"
    })
    @test_character = Character.create({
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
  describe "Character CRUD:" do
    it "Get all Characters" do
      get api_v1_characters_path(format: :json)
      json = JSON.parse(response.body)
      expect(json["data"].count).to eq(Character.count)
    end
    it "Creates a new Character" do
      expect {post api_v1_characters_path(format: :json), params: {character: {
        user_id: @test_user.id,
        name: "testy",
        strength: "10",
        dexterity: "10",
        constitution: "10",
        intelligence: "10",
        wisdom: "10",
        charisma: "10"
      }}}.to change(Character, :count).by(1)
      expect(response).to be_successful
    end
    it "GET a specific character" do
      get api_v1_character_path(@test_character.id)
      json = JSON.parse(response.body)
      expect(json["data"]["name"]).to eq(@test_character.name)
    end
    it "UPDATE a specific character" do
      patch api_v1_character_path(@test_character.id), params: {character: {
        user_id: @test_user.id,
        name: "New Name",
        strength: "11",
        dexterity: "11",
        constitution: "11",
        intelligence: "11",
        wisdom: "11",
        charisma: "11"
        }}
      json = JSON.parse(response.body)
      expect(json["data"]["strength"]).to eq(11)
      expect(response).to be_successful
    end
    it "DESTROY a specific character" do
      expect {delete api_v1_character_path(id: @test_character.id)}.to change(Character, :count).by(-1)
      expect(Character.find_by_id(@test_character.id)).to eq(nil)
      expect(response).to be_successful
    end
  end
end

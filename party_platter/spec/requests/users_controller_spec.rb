require 'rails_helper'

RSpec.describe "UsersControllers", type: :request do
  describe "GET /index" do
    pending "add some examples (or delete) #{__FILE__}"
  end
  describe "devise user functions:" do
    it "Create a New User" do
      password = "password"
      post api_v1_user_registration_path(format: :json), params: {user: {
        username: "textxyz",
        email: "testxyz@test.test",
        password: password,
        password_confirmation: password
      }}
      expect(response).to be_successful
    end
    it "user login" do
      username = Faker::Internet.username
      email = Faker::Internet.email
      password = "password"
      post api_v1_user_registration_path(format: :json), params: {user: {
        username: username,
        email: email,
        password: password,
        password_confirmation: password
      }}
      # username = Faker::Internet.username
      # email = Faker::Internet.email
      # password = "password"
      post api_v1_user_session_path(format: :json), params: {user: {
        username: username,
        email: email,
        password: password
      }}
      expect(response).to be_successful
    end
  end
end

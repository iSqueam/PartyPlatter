require 'rails_helper'

RSpec.describe "UsersControllers:", type: :request do
  before :each do
    @test_user = User.create({
      username: "tester1",
      email: "tester1@test.test",
      password: "password",
      password_confirmation: "password"
    })
  end
  # describe "GET /index" do
  #   pending "add some examples (or delete) #{__FILE__}"
  # end
  describe "Devise User functions:" do
    it "Create a New User" do
      expect {
        post api_v1_user_registration_path(format: :json), params: {user: {
          username: "textxyz",
          email: "testxyz@test.test",
          password: "password",
          password_confirmation: "password"
        }}
    }.to change(User, :count).by(1)
      expect(response).to be_successful
    end
    it "Login" do
      username = @test_user.username
      email = @test_user.email
      password = "password"
      post api_v1_user_session_path(format: :json), params: {user: {
        username: username,
        email: email,
        password: password
      }}
      expect(response).to be_successful
    end
  end
end

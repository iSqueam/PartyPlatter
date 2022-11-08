require 'rails_helper'

RSpec.describe "UsersControllers", type: :request do
  describe "GET /index" do
    pending "add some examples (or delete) #{__FILE__}"
  end
  describe "devise registrations" do
    it "Create a New User" do
      password = Faker::Internet.password
      post api_v1_user_registration_path(format: :json), params: {user: {
        username: Faker::Internet.username,
        email: Faker::Internet.email,
        password: password,
        password_confirmation: password
      }}
      expect(response).to be_successful
    end
  end
end

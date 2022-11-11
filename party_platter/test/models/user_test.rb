require "rails_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  Rspec.describe "Users", type: :create do
    describe "create new user" do
      user = User.create(FactoryBot.factory(:user))
      get users_path
      expect(response).to be_successful
    end
  end
end

require "factory_bot_rails"

FactoryBot.define do
  factory :membership do
    campaign { nil }
    character { nil }
  end

  factory :campaign do
    name {"New Campaign"}
    minplayers {"2"}
    maxplayers {"4"}
  end

  factory :character do
    name {"Mary Sue"}
    strength {"10"}
    dexterity {"10"}
    constitution {"10"}
    intelligence {"10"}
    wisdom {"10"}
    charisma {"10"}
  end

    factory :user do
      email { "tester@test.test" }
      username { "testuser1" }
      password { "password" }
      password_confirmation { "password" }
    end
  end
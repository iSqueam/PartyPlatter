require "factory_bot_rails"

FactoryBot.define do
  factory :campaign do
    
  end

  factory :character do
    
  end

    factory(:user) do
      email { Faker::Internet.email }
      username { Faker::Internet.username }
      password { Faker::Internet.password }
    end
  end
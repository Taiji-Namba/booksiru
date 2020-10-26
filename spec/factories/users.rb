FactoryBot.define do
  factory :user do
    nickname { Faker::Games::Witcher.character }
    email { Faker::Internet..unique.email }
    password { Faker::Internet.password }
  end
end

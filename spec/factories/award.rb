FactoryBot.define do
  factory :award do
    comment { Faker::Lorem.characters(number: 20) }
    is_public { Faker::Boolean.boolean }
    association :user
  end
end
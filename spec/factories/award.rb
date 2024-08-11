FactoryBot.define do
  factory :award do
    comment { Faker::Lorem.characters(number: 20) }
    is_public { Faker::Boolean.boolean }
    user
  end
end
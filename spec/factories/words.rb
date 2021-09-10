FactoryBot.define do
  factory :word do
    association :user
    word { Faker::Lorem.word }
    memo { Faker::Lorem.sentence }
  end
end

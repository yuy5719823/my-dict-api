FactoryBot.define do
  factory :word do
    association :user
    word { Faker::Lorem.word }
    memo { Faker::Lorem.sentence }
  end

  factory :word_default, class: 'Word' do
    association :user
    word { 'タイトル' }
    memo { 'メモ' }
  end
end

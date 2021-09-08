FactoryBot.define do
  factory :word do
    association :user
    word { 'タイトル' }
    memo { 'メモ' }
  end
end

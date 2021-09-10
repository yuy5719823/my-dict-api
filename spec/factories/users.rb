FactoryBot.define do
  factory :user do
    name      { 'user' }
    sequence(:email) { |n| "sample#{n}@example.com" }
    password  { 'password' }
    password_confirmation { 'password' }
  end
end

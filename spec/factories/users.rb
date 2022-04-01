FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "matey#{n}@example.com" }
  end
end

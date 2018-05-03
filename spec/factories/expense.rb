FactoryBot.define do
  factory :expense do
    concept Faker::Simpsons.location
    amount Faker::Number.number(7)
    association :category, factory: category
    association :user, factory: :user
    association :transaction_type, factory: :transaction_type
  end
end

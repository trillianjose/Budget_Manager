FactoryBot.define do
  factory :user do
      email Faker::Internet.email
      password Faker::Internet.password(6)
  end
end

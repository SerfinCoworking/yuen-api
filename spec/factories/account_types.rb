FactoryBot.define do
  factory :account_type do
    name { Faker::Currency.code }
  end
end

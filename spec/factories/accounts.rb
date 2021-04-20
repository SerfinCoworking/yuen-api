FactoryBot.define do
  factory :account do
    name { Faker::Bank.name }
    account_alias { Faker::Games::LeagueOfLegends.champion }
    cbu { Faker::Bank.account_number(digits: 22) }
    description { Faker::Lorem.paragraph(2) }
    balance { Faker::Number.number(digits: 5) }
    user_id { 1 }
    account_type factory: :account_type
  end
end

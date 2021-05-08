FactoryBot.define do
  factory :product_location do
    name { Faker::Address.state_abbr }
    company factory: :company
  end
end

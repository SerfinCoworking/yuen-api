FactoryBot.define do
  factory :product_category do
    parent { nil }
    name { Faker::Vehicle.car_type }
    company factory: :company
  end
end

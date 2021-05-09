FactoryBot.define do
  factory :product_category do
    parent { nil }
    name { Faker::Vehicle.car_type }
  end
end

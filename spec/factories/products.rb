FactoryBot.define do
  factory :product do
    barcode { Faker::Barcode.ean(13) }
    name { Faker::Vehicle.manufacture }
    description { Faker::Vehicle.standard_specs }
    company factory: :company
    category factory: :product_category
  end
end

FactoryBot.define do
  factory :product do
    barcode { "MyString" }
    name { "MyString" }
    description { "MyText" }
    company { nil }
  end
end

FactoryBot.define do
  factory :lot do
    stock { nil }
    company { nil }
    product { nil }
    provider { nil }
    cost_price { "9.99" }
    manufacturing_date { "2021-06-27" }
    expiry_date { "2021-06-27" }
    reserved_quantity { 1 }
    available_quantity { 1 }
    total_quantity { 1 }
  end
end

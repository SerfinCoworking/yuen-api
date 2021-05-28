FactoryBot.define do
  factory :unity do
    unity_type { 1 }
    equivalence_type { 1 }
    name { "MyString" }
    symbol { "MyString" }
    equivalence { "9.99" }
  end
end

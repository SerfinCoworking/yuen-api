FactoryBot.define do
  factory :customer do
    first_name { "MyString" }
    last_name { "MyString" }
    nickname { "MyString" }
    address { "MyString" }
    phone { "MyString" }
    cuit { "MyString" }
    email { "MyString" }
    organization { "" }
  end
end

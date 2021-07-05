100.times {
  Company.create(
    name: Faker::Company.name, 
    logo: Faker::Company.logo, 
    email: Faker::Internet.email,
    address: Faker::Address.full_address,
    phone: Faker::PhoneNumber.cell_phone
  )
}

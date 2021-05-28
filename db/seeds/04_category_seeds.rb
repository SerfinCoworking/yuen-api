# Create 10 product categories for each company
Company.find_each do |company|
  10.times {
    ProductCategory.create(
      name: Faker::Commerce.department,
      company: company
    )
  }
end
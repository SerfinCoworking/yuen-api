# Create 10 product categories for each company
Company.find_each do |company|
  10.times do
    ProductCategory.create(
      name: Faker::Commerce.department,
      company: company
    )
  end

  CustomerCategory.create(
    name: 'Mayorista',
    company: company
  )

  CustomerCategory.create(
    name: 'Final',
    company: company
  )
end

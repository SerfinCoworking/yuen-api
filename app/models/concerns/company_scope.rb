module CompanyScope
  scope :by_company, ->(a_company) { where(company: a_company) }
end

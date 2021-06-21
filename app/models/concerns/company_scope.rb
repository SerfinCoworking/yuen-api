module CompanyScope
  extend ActiveSupport::Concern

  included do
    scope :by_company, ->(a_company) { where(company: a_company) }
  end
end

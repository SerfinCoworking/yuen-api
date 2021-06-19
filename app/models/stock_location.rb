class StockLocation < ApplicationRecord
  # Relationships
  belongs_to :company

  # Validations
  validates_presence_of :name, :company_id

  # Scopes
  scope :by_company, ->(a_company) { where(company: a_company) }
end

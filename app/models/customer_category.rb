class CustomerCategory < ApplicationRecord
  # Relationships
  belongs_to :company
  has_many :customers

  # Validations
  validates_presence_of :name, :company_id

  # Scopes
  scope :by_company, ->(a_company) { where(company: a_company) }
end

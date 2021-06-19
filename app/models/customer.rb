class Customer < ApplicationRecord
  # Relationships
  belongs_to :company
  belongs_to :category, class_name: 'CustomerCategory'

  # Validations
  validates_presence_of :first_name, :last_name, :email, :company_id, :category_id

  # Scopes
  scope :by_company, ->(a_company) { where(company: a_company) }
end

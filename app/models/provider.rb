class Provider < ApplicationRecord
  # Relationships
  belongs_to :company
  belongs_to :category, class_name: 'ProviderCategory'

  # Validations
  validates_presence_of :name, :email, :company_id, :category_id

  # Scopes
  scope :by_company, ->(a_company) { where(company: a_company) }
end

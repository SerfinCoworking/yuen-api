class ProviderCategory < ApplicationRecord
  include CompanyScope

  # Relationships
  belongs_to :company
  has_many :providers

  # Validations
  validates_presence_of :name, :company_id
end

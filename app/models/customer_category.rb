class CustomerCategory < ApplicationRecord
  include CompanyScope

  # Relationships
  belongs_to :company
  has_many :customers

  # Validations
  validates_presence_of :name, :company_id
end

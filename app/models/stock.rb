class Stock < ApplicationRecord
  include CompanyScope

  # Relationships
  belongs_to :product
  belongs_to :company

  # Validations
  validates_presence_of :product, :company, :available_quantity, :reserved_quantity, :total_quantity
end

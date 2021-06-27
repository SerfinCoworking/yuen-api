class Lot < ApplicationRecord
  include CompanyScope

  # Relationships
  belongs_to :stock
  belongs_to :company
  belongs_to :product
  belongs_to :provider

  # Validations
  validates_presence_of :stock, :company, :product, :provider, :reserved_quantity, :available_quantity, :total_quantity,
                        :cost_price
end

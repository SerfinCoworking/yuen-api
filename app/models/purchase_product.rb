class PurchaseProduct < ApplicationRecord
  # Relationships 
  belongs_to :purchase
  belongs_to :product

  # Validations
  validates_presence_of :purchase, :product, :quantity, :presentation
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :presentation, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end

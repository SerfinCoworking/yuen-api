class PurchaseProduct < ApplicationRecord
  # Relationships
  belongs_to :purchase
  belongs_to :product

  # Validations
  validates_presence_of :purchase, :product, :quantity, :presentation, :cost_price
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :presentation, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :cost_price, numericality: { greater_than_or_equal_to: 0 }

  before_save :calc_total_line

  def calc_total_line
    self.total_line = quantity * presentation * cost_price
  end
end

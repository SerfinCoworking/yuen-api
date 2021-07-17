class PurchaseProduct < ApplicationRecord
  # Relationships
  belongs_to :purchase
  belongs_to :product

  # Validations
  validates_presence_of :purchase, :product, :quantity, :presentation, :cost_price
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :presentation, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :cost_price, numericality: { greater_than_or_equal_to: 0 }

  delegate :provider_id, :company_id, to: :purchase, prefix: false
  delegate :name, to: :product, prefix: true

  before_save :calc_total_line

  def calc_total_line
    self.total_line = quantity * presentation * cost_price
  end

  def receive_stock
    stock = Stock.find_by(product_id: product_id, company_id: purchase.company_id)
    stock = Stock.create(product_id: product_id, company_id: purchase.company_id) unless stock.present?
    stock.increment_lot_from_purchase_product(self)
  end
end

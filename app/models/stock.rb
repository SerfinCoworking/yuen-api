class Stock < ApplicationRecord
  include CompanyScope

  # Relationships
  belongs_to :product
  belongs_to :company

  has_many :lots

  # Validations
  validates_presence_of :product, :company, :available_quantity, :reserved_quantity, :total_quantity

  def increment_lot_from_purchase_product(a_purchase_product)
    lot = self.lots.where(
      product_id: a_purchase_product.product_id, expiry_date: a_purchase_product.expiry_date, company_id: a_purchase_product.company_id,
      cost_price: a_purchase_product.cost_price, provider_id: a_purchase_product.provider_id).first
    if lot.present?
      lot.increment_quantity(a_purchase_product.quantity)
    else
      lot = Lot.create!(product_id: product_id, company_id: a_purchase_product.company_id,
      expiry_date: a_purchase_product.expiry_date, stock_id: self.id,
        provider_id: a_purchase_product.provider_id, cost_price: a_purchase_product.cost_price)
      lot.increment_quantity(a_purchase_product.quantity)
    end
  end
end

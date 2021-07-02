class Purchase < ApplicationRecord
  include CompanyScope

  enum status: { in_progress: 0, received: 1 }

  # Relationships
  belongs_to :provider
  belongs_to :company
  has_many :purchase_products
  has_many :products, through: :purchase_products, inverse_of: :purchases

  accepts_nested_attributes_for :purchase_products

  # Validations
  validates_presence_of :provider_id, :company_id

  def receive
    purchase_products.each do | purchase_product |
      purchase_product.receive_stock
    end
    received!
  end
end

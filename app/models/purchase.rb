class Purchase < ApplicationRecord
  # Relationships
  belongs_to :provider
  belongs_to :company
  belongs_to :price_list
  has_many :purchase_products
  has_many :products, through: :purchase_products, inverse_of: :purchases

  accepts_nested_attributes_for :purchase_products

  # Validations
  validates_presence_of :provider_id, :company_id, :price_list_id
end

class PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :provider, :company, :status, :total_price, :reference_number, :date, :price_list_updated_date

  belongs_to :provider
  belongs_to :company
  has_many :purchase_products
  has_many :products, through: :purchase_products, inverse_of: :purchases
end

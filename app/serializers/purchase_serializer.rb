class PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :provider_id, :provider, :status, :total_price, :reference_number, :request_date,
             :price_list_updated_date, :purchase_products, :products

  has_many :purchase_products
  has_many :products, through: :purchase_products, inverse_of: :purchases
end

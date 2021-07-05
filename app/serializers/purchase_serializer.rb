class PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :provider, :company, :status, :total_price, :reference_number, :request_date,
             :price_list_updated_date, :purchase_products
end

class PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :provider_id, :provider, :status, :total_price, :reference_number, :request_date,
             :price_list_updated_date, :purchase_products
end

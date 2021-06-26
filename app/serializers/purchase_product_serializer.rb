class PurchaseProductSerializer < ActiveModel::Serializer
  attributes :id, :purchase_id, :product_id, :quantity, :presentation, :expiry_date, :cost_price, :total_line, 
             :purchase, :product

  belongs_to :purchase
  belongs_to :product
end

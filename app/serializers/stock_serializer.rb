class StockSerializer < ActiveModel::Serializer
  attributes :id, :company_id, :product_id, :available_quantity, :reserved, :total_quantity, :product, :company

  belongs_to :product
  belongs_to :company
end

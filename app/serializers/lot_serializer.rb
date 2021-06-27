class LotSerializer < ActiveModel::Serializer
  attributes :id, :stock_id, :company_id, :provider_id, :cost_price, :manufacturing_date, :expiry_date,
             :reserved_quantity, :available_quantity, :total_quantity, :stock, :company, :product, :provider

  belongs_to :stock
  belongs_to :company
  belongs_to :product
  belongs_to :provider
end

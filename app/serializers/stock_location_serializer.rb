class StockLocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :company

  belongs_to :company
end

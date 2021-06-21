class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :unity, :quantity_per_unit, :barcode, :description

  belongs_to :unity
  belongs_to :category
  belongs_to :company
end

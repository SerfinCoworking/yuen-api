class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :category_id, :company_id, :unity_id, :quantity_per_unit, :barcode,
             :description, :category, :unity

  has_many :purchase_products
  has_many :purchases, through: :purchase_products
end

class PurchaseProductSerializer < ActiveModel::Serializer
  attributes :id, :purchase, :product

  belongs_to :purchase
  belongs_to :product
end

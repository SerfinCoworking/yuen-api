class CustomerCategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :company

  belongs_to :company
end

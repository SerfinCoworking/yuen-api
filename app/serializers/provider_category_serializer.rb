class ProviderCategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :company

  belongs_to :company
  has_many :providers
end

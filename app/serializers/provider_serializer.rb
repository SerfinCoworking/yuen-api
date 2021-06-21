class ProviderSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :address, :phone, :cuit, :webpage, :category, :company

  belongs_to :company
  belongs_to :category, class_name: 'ProviderCategory'
end

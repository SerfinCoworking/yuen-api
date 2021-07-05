class ProviderSerializer < ActiveModel::Serializer
  attributes :id, :category_id, :company_id, :name, :email, :address, :phone, :cuit, :webpage, :category, :company
end

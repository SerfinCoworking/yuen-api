class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :nickname, :address, :phone, :cuit, :email, :organization, :company

  belongs_to :company
end

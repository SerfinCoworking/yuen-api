class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :nickname, :address, :phone, :cuit, :email, :organization, :company, 
             :category

  belongs_to :company
  belongs_to :category, class_name: 'CustomerCategory'
end

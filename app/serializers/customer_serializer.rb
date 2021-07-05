class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :nickname, :address, :phone, :cuit, :email, :organization, :company, :company_id, :category_id,
             :category

  belongs_to :company
  belongs_to :category, class_name: 'CustomerCategory'
end

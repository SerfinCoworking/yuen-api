class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :address, :phone, :logo, :web_page
end

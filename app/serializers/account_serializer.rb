class AccountSerializer < ActiveModel::Serializer
  attributes :id, :name, :company, :account_alias, :cbu, :description, :balance
end

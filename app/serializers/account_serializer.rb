class AccountSerializer < ActiveModel::Serializer
  attributes :id, :name, :account_alias, :account_type_id, :cbu,
             :description, :balance, :account_type
end

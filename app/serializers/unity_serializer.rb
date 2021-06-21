class UnitySerializer < ActiveModel::Serializer
  attributes :id, :name, :unity_type, :symbol, :equivalence, :equivalence_unit
end
